import 'package:dapr_common/dapr_common.dart';

import '../../abstractions/server_pub_sub.dart';
import 'grpc_server.dart';

class GrpcServerPubSub implements ServrePubSub<DaprGrpcServer> {
  @override
  DaprGrpcServer server;

  GrpcServerPubSub({required this.server});

  @override
  Future<void> subscribe({
    required String pubSubName,
    required String topic,
    required PubSubCallback callback,
    String? route,
    bool rawEvents = false,
  }) async {
    server.implementation.pubSubCallbackMap.putIfAbsent(
      PubSubRoute(pubSubName: pubSubName, topic: topic, route: route ?? ''),
      () => callback,
    );
  }
}
