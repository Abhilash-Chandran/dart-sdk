import 'package:shelf_plus/shelf_plus.dart' as shp;

import '../../abstractions/server.dart';
import 'http_server_impl.dart';

class DaprHttpServer implements Server {
  late final String serverHost;
  late final int serverPort;
  late final shp.ShelfRunContext _shelfRunContext;
  @override
  late final Server server;

  @override
  late final HttpServerImpl implementation;

  final List<shp.Handler> httpRouteHandlers = [];

  DaprHttpServer() {
    implementation = HttpServerImpl();
  }

  @override
  Future<void> start(String host, int port,
      {List<shp.Handler> handlers = const []}) async {
    serverPort = port;
    serverHost = host;
    _shelfRunContext = await shp.shelfRun(
      () => shp.cascade([...handlers]),
      defaultBindAddress: serverHost,
      defaultBindPort: serverPort,
      defaultEnableHotReload: false,
    );
  }

  @override
  Future<void> stop() async {
    await _shelfRunContext.close();
  }
}
