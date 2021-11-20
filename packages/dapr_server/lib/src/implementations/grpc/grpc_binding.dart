import 'package:dapr_common/dapr_common.dart';

import '../../abstractions/server_binding.dart';
import 'grpc_server.dart';

class GrpcServerBinding implements ServerBinding<DaprGrpcServer> {
  @override
  final DaprGrpcServer server;

  GrpcServerBinding({required this.server});
  @override
  Future<void> receive(
      {required String bindingName, required BindingCallback callback}) async {
    server.implementation.bindingsCallbackMap
        .putIfAbsent(bindingName, () => callback);
  }
}
