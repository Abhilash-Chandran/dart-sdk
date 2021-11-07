import 'package:dapr_client/src/abstractions/client/client.dart';
import 'package:dapr_client/src/abstractions/client/client_state.dart';
import 'package:dapr_client/src/implementation/client/grpc/grpc_client.dart';
import 'package:dapr_client/src/implementation/client/grpc/grpc_state.dart';
import 'package:dapr_client/src/implementation/client/http/http_client.dart';
import 'package:dapr_client/src/implementation/client/http/http_state.dart';

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
        final _client =
            DaprHttpClient(clientHost: daprHost, clientPort: daprPort);
        client = _client;
        state = HttpClientState(daprHttpClient: _client);
        break;
      default:
        final _client =
            DaprGrpcClient(clientHost: daprHost, clientPort: daprPort);
        client = _client;
        state = GrpcClientState(daprGrpcclient: _client);
    }
  }
}
