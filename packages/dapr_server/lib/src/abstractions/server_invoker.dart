import 'package:dapr_common/dapr_common.dart';

/// Abstract definition for Service Invoker.
abstract class ServerInvoker {

  /// Registers a http enpoint on the [methodname] for the [HttpMethod] passed
  /// in via [callbackOptions.method]. On the invokation of this endpoint, the
  /// provided [callback] will be called with an instance of
  /// [InvokerCallbackContent] built using the data, queryParams, and other
  /// information passed in the request to this endpoint.
  Future<dynamic> listen({
    required String methodName,
    required InvokerCallback callback,
    required InvokerCallbackOptions callbackOptions,
  });
}
