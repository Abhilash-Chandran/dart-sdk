abstract class ClientPubSub {
  publish({
    required String pubSubName,
    required String topicName,
    Object? data,
  });
}
