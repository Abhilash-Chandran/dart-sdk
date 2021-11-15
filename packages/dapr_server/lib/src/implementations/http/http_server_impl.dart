import 'package:dapr_common/dapr_common.dart';

class HttpServerImpl {
  /// Holds a list of routes mapped to a one or more topics in one or more
  /// deployed pubsub components
  final List<PubSubRoute> pubSubRoutes = <PubSubRoute>[];

  registerPubSubRoute({
    required String pubSubName,
    required String topicName,
    required String route,
  }) {
    pubSubRoutes.add(
      PubSubRoute(pubSubName: pubSubName, topicName: topicName, route: route),
    );
  }
}
