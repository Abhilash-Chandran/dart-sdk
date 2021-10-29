import 'package:dapr_client/src/enums/http_method.dart';

abstract class ClientInvoker {
  invoke({
    required String appId,
    required String methodName,
    required HttpMethod httpMethod,
    Object? data,
  });
}
