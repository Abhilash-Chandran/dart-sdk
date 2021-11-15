abstract class Server {
  // String get serverAddress;
  dynamic get server;
  dynamic get implementation;

  /// Stop the server and release the resources.
  Future<void> stop();

  /// Start the server with the provided host and port bindings.
  Future<void> start(String host, String port);
}
