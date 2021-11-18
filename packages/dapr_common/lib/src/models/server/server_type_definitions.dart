import 'package:dapr_common/src/models/server/generated/bindings_models.dart';

import '../../../dapr_common.dart';

typedef BindingCallback = Future<dynamic> Function(BindingEvent data);
typedef PubSubCallback = Future<PubSubResponse> Function(dynamic data);

typedef InvokerCallback = Future<dynamic> Function(InvokerCallbackContent data);
