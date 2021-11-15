import 'dart:io';

import 'package:dapr_common/dapr_common.dart';

import 'grpc/grpc_server.dart';
import 'http/http_server.dart';
import '../abstractions/server.dart';

class DaprServer {
  /// Defaults to 127.0.0.1
  final String serverHost;

  /// Defaults to the APP_PORT environment variable set by Dapr.
  final String? _serverPort;

  /// Defaults to 127.0.0.1
  final String daprHost;

  /// Defaults to the DAPR_HTTP_PORT or DAPR_GRPC_PORT environment variable set
  /// by Dapr.
  final String? _daprPort;

  /// Defaults to [CommunicationProtocol.http]
  final CommunicationProtocol communicationProtocol;

  /// The server instance depending on the choice of [communicationProtocol].
  late final Server server;

  DaprServer({
    this.serverHost = DaprConf.defAppHost,
    String? serverPort,
    this.daprHost = DaprConf.defDaprHost,
    String? daprPort,
    this.communicationProtocol = CommunicationProtocol.http,
  })  : _serverPort =
            serverPort ??= Platform.environment['APP_PORT'] ?? '50051',
        _daprPort = daprPort ??= Platform.environment[
            communicationProtocol == CommunicationProtocol.http
                ? 'DAPR_HTTP_PORT'
                : 'DAPR_GRPC_PORT'] {
    // validate the server port

    // Validate the dapr port
    switch (communicationProtocol) {
      case CommunicationProtocol.grpc:
        var _server = DaprGrpcServer();
        server = _server;
        break; 
      case CommunicationProtocol.http:
      default:
        var _server =
            DaprHttpServer(serverHost: serverHost, serverPort: serverPort);
        server = _server;
    }
  }
  Future<void> startServer() async {
    server.start(serverHost, _serverPort!);
  }
}
