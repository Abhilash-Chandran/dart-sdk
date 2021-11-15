import 'package:dapr_server/src/implementations/http/http_server_impl.dart';

import '../../abstractions/server.dart';

class DaprHttpServer implements Server {
  final String serverHost;
  final String serverPort;

  @override
  late final Server server;

  @override
  late final HttpServerImpl implementation;
  
  DaprHttpServer({
    required this.serverHost,
    required this.serverPort,
  }) {
    implementation = HttpServerImpl();
  }

  @override
  Future<void> start(String host, String port) {
    // TODO: implement start
    throw UnimplementedError();
  }

  @override
  Future<void> stop() {
    // TODO: implement stop
    throw UnimplementedError();
  }
}
