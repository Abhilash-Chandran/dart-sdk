import 'dart:convert';

import 'package:shelf_plus/shelf_plus.dart';
import 'package:dapr_common/dapr_common.dart';

import '../../abstractions/server_binding.dart';

/// A http based implementation of [ServerBinding].
class HttpServerBinding implements ServerBinding {
  /// All the http endpoints related to binding is registered in this handler.
  RouterPlus bindingsHandler = RouterPlus();
  @override
  Future<dynamic> receive({
    required String bindingName,
    required BindingCallback callback,
  }) async {
    // Register a options endpoint with this binding name which will be used by // Dapr.
    //
    // Ref: https://docs.dapr.io/developing-applications/building-blocks/bindings/bindings-overview/#input-bindings
    bindingsHandler.options('/$bindingName', (req) {
      print('Options request is called.');
      Response.ok('');
    });

    // Register the binding enpoint and assign the handler performing the
    // callback.
    // Return status code is doumented in the following.
    // https://docs.dapr.io/reference/api/bindings_api/#binding-payload
    bindingsHandler.post('/$bindingName', (Request req) async {
      try {
        final body = await req.body.asString;
        print(body);
        final bindingEvent = BindingEvent(
          data: body,
          metadata: req.headers,
        );
        await callback(bindingEvent);
        return Response.ok('');
      } catch (e) {
        return Response.internalServerError(
          body: jsonEncode(
            {
              'error': e.toString(),
            },
          ),
        );
      }
    });
  }
}
