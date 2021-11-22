import 'dart:convert';

import 'package:dapr_client/src/abstractions/client_pubsub.dart';
import 'package:dapr_client/src/implementations/grpc/grpc_client.dart';
import 'package:dapr_proto/dapr_proto.dart' as dp;

class GrpcClientPubSub implements ClientPubSub<DaprGrpcClient> {
  @override
  final DaprGrpcClient client;

  late final dp.DaprClient _daprClient;
  GrpcClientPubSub({required this.client}) {
    _daprClient = client.client;
  }

  @override
  Future<void> publish({
    required String pubSubName,
    required String topicName,
    Object? data,
  }) async {
    final _publishEventRequest = dp.PublishEventRequest(
        data: utf8.encode(
          jsonEncode(data),
        ),
        topic: topicName,
        pubsubName: pubSubName);
    await _daprClient.publishEvent(_publishEventRequest);
  }
}
