import 'package:dapr_common/dapr_common.dart';

import '../abstractions/client.dart';
import '../abstractions/client_secrets.dart';
import '../abstractions/client_state.dart';

import 'grpc/grpc_client.dart';
import 'grpc/grpc_state.dart';
import 'grpc/grpc_secret.dart';

import 'http/http_client.dart';
import 'http/http_secret.dart';
import 'http/http_state.dart';

class DaprClient {
  final String daprHost;
  final String daprPort;
  final CommunicationProtocol communicationProtocol;
  late final Client client;
  late final ClientState state;
  late final ClientSecret secret;

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
        secret = HttpClientSecret(daprHttpClient: _client);
        break;
      default:
        final _client =
            DaprGrpcClient(clientHost: daprHost, clientPort: daprPort);
        client = _client;
        state = GrpcClientState(daprGrpcclient: _client);
        secret = GrpcClientSecret(daprGrpcClient: _client);
    }
  }
}
