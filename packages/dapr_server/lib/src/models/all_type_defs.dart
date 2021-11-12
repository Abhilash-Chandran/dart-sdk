import 'package:dapr_server/src/models/generated/invoker_models.dart';

typedef BindingCallback = Future<dynamic> Function(dynamic data);
typedef PubSubCallback = Future<dynamic> Function(dynamic data);

typedef InvokerCallback = Future<dynamic> Function(InvokerCallbackContent data);
