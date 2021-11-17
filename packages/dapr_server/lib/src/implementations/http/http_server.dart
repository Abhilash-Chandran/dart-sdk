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

  /// Healthz handler
  shp.RouterPlus daprGenericRoutes = shp.RouterPlus();

  DaprHttpServer() {
    implementation = HttpServerImpl();

    ///  https://github.com/dapr/go-sdk/blob/d9ad49d2a6036d4498979a486245236337b3083b/service/http/topic.go#L62
    daprGenericRoutes.get('/healthz', () => shp.Response.ok(null));

    /// TODO: Add the configuration handler as well.
  }

  @override
  Future<void> start(String host, int port,
      {List<shp.Handler> handlers = const []}) async {
    serverPort = port;
    serverHost = host;
    _shelfRunContext = await shp.shelfRun(
      () => shp.cascade([...handlers, daprGenericRoutes]),
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
