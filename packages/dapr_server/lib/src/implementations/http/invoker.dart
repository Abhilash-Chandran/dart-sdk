import 'package:dapr_common/dapr_common.dart';
import 'package:shelf_plus/shelf_plus.dart';

import '../../abstractions/server_invoker.dart';

class HttpServerInvoker implements ServerInvoker {
  /// The router plus handler to which the new routes related to invoker will
  /// be added.
  final RouterPlus invokerHandler = RouterPlus();

  @override
  Future<dynamic> listen({
    required String methodName,
    required InvokerCallback callback,
    required InvokerCallbackOptions callbackOptions,
  }) async {
    // TODO: replace this swich case with an extension based approach for
    //  enums and use invokeHandler.add method using the verb name.
    switch (callbackOptions.method) {
      case HttpMethod.get:
        invokerHandler.get(
          '/$methodName',
          _genericHandler(callback),
        );
        break;
      case HttpMethod.post:
        invokerHandler.post(
          '/$methodName',
          _genericHandler(callback),
        );
        break;
      case HttpMethod.put:
        invokerHandler.put(
          '/$methodName',
          _genericHandler(callback),
        );
        break;
      case HttpMethod.delete:
        invokerHandler.delete(
          '/$methodName',
          _genericHandler(callback),
        );
        break;
    }
  }

  /// A generic handler for all the http methods.
  ///
  /// The provided callback will be called with a [InvokerCallbackContent]
  /// instance built using the information from [request].
  Function _genericHandler(InvokerCallback callback) {
    return (Request req) async {
      final body = await req.body.asString;
      late final dynamic cbResp;
      try {
        cbResp = await callback(
          InvokerCallbackContent(
            body: body,
            query: req.url.queryParameters,
            metadata: InvokerCallbackMetadata(
              contentType: req.headers['Content-type'],
            ),
          ),
        );
        return Response.ok(cbResp);
      } on Exception catch (e) {
        return Response.internalServerError(body: e);
      }
    };
  }
}
