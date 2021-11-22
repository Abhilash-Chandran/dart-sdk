abstract class ClientPubSub<T> {
  /// The client for the chose protocol.
  T get client;
  Future<void> publish({
    required String pubSubName,
    required String topicName,
    Object? data,
  });
}
