import 'package:dapr_common/dapr_common.dart';

typedef BindingCallback = Future<dynamic> Function(dynamic data);
typedef PubSubCallback = Future<dynamic> Function(dynamic data);

typedef InvokerCallback = Future<dynamic> Function(InvokerCallbackContent data);
