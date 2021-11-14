import 'package:dapr_common/dapr_common.dart';

abstract class ClientInvoker {
  invoke({
    required String appId,
    required String methodName,
    required HttpMethod httpMethod,
    Object? data,
  });
}
