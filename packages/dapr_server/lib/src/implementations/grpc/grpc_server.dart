import '../../abstractions/server.dart';

class DaprGrpcServer implements Server {
  late final dynamic implementation;

  @override
  // TODO: implement server
  get server => throw UnimplementedError();

  @override
  Future<void> start(String host, int port) {
    // TODO: implement start
    throw UnimplementedError();
  }

  @override
  Future<void> stop() {
    // TODO: implement stop
    throw UnimplementedError();
  }
}
