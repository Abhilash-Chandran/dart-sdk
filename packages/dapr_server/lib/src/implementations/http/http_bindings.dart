import 'dart:convert';

import 'package:shelf_plus/shelf_plus.dart';
import 'package:dapr_common/dapr_common.dart';

import '../../abstractions/server_binding.dart';

/// A http based implementation of [ServerBinding].
class HttpServerBinding implements ServerBinding {
  /// All the http endpoints related to binding is registered in this handler.
  RouterPlus bindingHandler = RouterPlus();
  @override
  Future<dynamic> receive(String bindingName, BindingCallback callback) async {
    // Register a options endpoint with this binding name which will be used by // Dapr.
    //
    // Ref: https://docs.dapr.io/developing-applications/building-blocks/bindings/bindings-overview/#input-bindings
    bindingHandler.options('/$bindingName', (req) => Response.ok(null));

    // Register the binding enpoint and assign the handler performing the
    // callback.
    // Return status code is doumented in the following.
    // https://docs.dapr.io/reference/api/bindings_api/#binding-payload
    bindingHandler.post('/$bindingName', (Request req) async {
      try {
        final body = await req.body.asString;
        final bindingEvent = BindingEvent(
          data: body,
          metadata: req.headers,
        );
        await callback(bindingEvent);
        return Response.ok(null);
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
