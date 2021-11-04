import '../../enums/communication_protocol.dart';

class DaprClient {
  final String daprHost;
  final String daprPort;
  final CommunicationProtocol communicationProtocol;

  DaprClient({
    required this.daprHost,
    required this.daprPort,
    this.communicationProtocol = CommunicationProtocol.http,
  }) {}
}
