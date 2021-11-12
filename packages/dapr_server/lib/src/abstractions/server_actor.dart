abstract class ServerActor {
  Future<void> registerActor();
  Future<List<String>> get registeredActors;
  Future<void> init();
  Future<void> deactivateActor(
    String actorType,
    String actorId,
  );
}
