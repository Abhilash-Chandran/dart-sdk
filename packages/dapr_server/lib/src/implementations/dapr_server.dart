import 'dart:convert';
import 'dart:io';

import 'package:dapr_common/dapr_common.dart';
import 'package:dapr_server/src/abstractions/server_pub_sub.dart';
import 'package:dapr_server/src/exceptions/dapr_server_exceptions.dart';
import 'package:dapr_server/src/implementations/http/invoker.dart';
import 'package:dapr_server/src/implementations/http/pub_sub.dart';
import '../abstractions/server_invoker.dart';
import 'package:shelf_plus/shelf_plus.dart' as shp;

import 'grpc/grpc_server.dart';
import 'http/http_server.dart';
import '../abstractions/server.dart';

class DaprServer {
  /// Defaults to 127.0.0.1
  final String serverHost;

  /// Defaults to the APP_PORT environment variable set by Dapr.
  late final int _serverPort;

  /// Defaults to 127.0.0.1
  final String daprHost;

  /// Defaults to the DAPR_HTTP_PORT or DAPR_GRPC_PORT environment variable set
  /// by Dapr.
  late final int? _daprPort;

  /// Defaults to [CommunicationProtocol.http]
  final CommunicationProtocol communicationProtocol;

  /// The server instance depending on the choice of [communicationProtocol].
  late final Server server;

  late final ServerInvoker invoker;
  late final ServrePubSub pubsub;

  final List<shp.Handler> _externalHttpRouteHandlers = [];

  DaprServer({
    this.serverHost = DaprConf.defAppHost,
    int? serverPort,
    this.daprHost = DaprConf.defDaprHost,
    int? daprPort,
    this.communicationProtocol = CommunicationProtocol.http,
    List<shp.Handler> additionalRouteHandlers = const [],
  }) {
    // set default values from configurations if the environment variables is
    // not set or the port is not provided.
    _serverPort = serverPort ??=
        int.tryParse(Platform.environment['APP_PORT'] ?? '') ??
            DaprConf.defHttpAppPort;
    // set default values from configurations if the environment variables is
    // not set or the port is not provided.
    _daprPort = daprPort ??= int.tryParse(Platform.environment[
            communicationProtocol == CommunicationProtocol.http
                ? 'DAPR_HTTP_PORT'
                : 'DAPR_GRPC_PORT'] ??
        '');
    _daprPort ??= communicationProtocol == CommunicationProtocol.http
        ? DaprConf.defDaprHttpPort
        : DaprConf.defDaprGrpcPort;
    _externalHttpRouteHandlers.addAll(additionalRouteHandlers);
    switch (communicationProtocol) {
      case CommunicationProtocol.grpc:
        server = DaprGrpcServer();
        break;
      case CommunicationProtocol.http:
      default:
        server = DaprHttpServer();
        invoker = HttpServerInvoker();
        pubsub = HttpPubSub();
    }
  }
  Future<void> startServer() async {
    if (communicationProtocol == CommunicationProtocol.http) {
      var _server = server as DaprHttpServer;
      var _invoker = invoker as HttpServerInvoker;
      var _pubsub = pubsub as HttpPubSub;

      /// Start the http server.
      await _server.start(
        serverHost,
        _serverPort,
        handlers: [
          _invoker.invokerHandler,
          _pubsub.pubSubHandler,
          ..._externalHttpRouteHandlers,
        ],
      );
    } else {
      server.start(serverHost, _serverPort);
    }
  }

  /// Stops the underlying server.
  Future<void> stop() async {
    await server.stop();
  }
}
