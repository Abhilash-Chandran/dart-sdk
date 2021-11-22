import 'dart:convert';

import 'package:dapr_client/src/abstractions/client_pubsub.dart';
import 'package:dapr_common/dapr_common.dart';
import 'http_client.dart';

class HttpClientPubSub implements ClientPubSub<DaprHttpClient> {
  @override
  DaprHttpClient client;
  HttpClientPubSub({required this.client});

  @override
  Future<void> publish({
    required String pubSubName,
    required String topicName,
    Object? data,
  }) async {
    await client.executeDaprApiCall(
      apiUrl: '/publish/$pubSubName/$topicName',
      httpMethod: HttpMethod.post,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
  }
}
