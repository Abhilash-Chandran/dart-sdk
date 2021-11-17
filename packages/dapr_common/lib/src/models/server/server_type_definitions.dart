import '../../../dapr_common.dart';

typedef BindingCallback = Future<dynamic> Function(dynamic data);
typedef PubSubCallback = Future<PubSubResponse> Function(dynamic data);

typedef InvokerCallback = Future<dynamic> Function(InvokerCallbackContent data);
