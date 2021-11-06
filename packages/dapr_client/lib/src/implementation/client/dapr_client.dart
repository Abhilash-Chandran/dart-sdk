import 'package:dapr_client/src/abstractions/client/client.dart';
import 'package:dapr_client/src/abstractions/client/client_state.dart';
import 'package:dapr_client/src/implementation/client/http/http_client.dart';
import 'package:dapr_client/src/implementation/client/http/state.dart';

import '../../enums/communication_protocol.dart';

class DaprClient {
  final String daprHost;
  final String daprPort;
  final CommunicationProtocol communicationProtocol;
  late final Client client;
  late final ClientState state;
  DaprClient({
    required this.daprHost,
    required this.daprPort,
    this.communicationProtocol = CommunicationProtocol.http,
  }) {
    switch (communicationProtocol) {
      case CommunicationProtocol.http:
        client = DaprHttpClient(clientHost: daprHost, clientPort: daprPort);
        state = HttpClientState(client: client as DaprHttpClient);
        break;
      default:
    }
  }
}
