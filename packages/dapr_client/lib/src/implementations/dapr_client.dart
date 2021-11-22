import 'package:dapr_client/src/abstractions/client_binding.dart';
import 'package:dapr_client/src/abstractions/client_invoker.dart';
import 'package:dapr_client/src/abstractions/client_pubsub.dart';
import 'package:dapr_client/src/implementations/grpc/grpc_binding.dart';
import 'package:dapr_client/src/implementations/grpc/grpc_invoker.dart';
import 'package:dapr_client/src/implementations/grpc/grpc_pub_sub.dart';
import 'package:dapr_client/src/implementations/http/http_binding.dart';
import 'package:dapr_client/src/implementations/http/http_invoker.dart';
import 'package:dapr_client/src/implementations/http/http_pub_sub.dart';
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
  final int daprPort;
  final CommunicationProtocol communicationProtocol;
  late final Client client;
  late final ClientState state;
  late final ClientSecret secret;
  late final ClientBinding binding;
  late final ClientInvoker invoker;
  late final ClientPubSub pubSub;
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
        state = HttpClientState(client: _client);
        secret = HttpClientSecret(client: _client);
        binding = HttpClientBinding(client: _client);
        pubSub = HttpClientPubSub(client: _client);
        invoker = HttpClientInvoker(client: _client);
        break;
      default:
        final _client =
            DaprGrpcClient(clientHost: daprHost, clientPort: daprPort);
        client = _client;
        state = GrpcClientState(client: _client);
        secret = GrpcClientSecret(client: _client);
        binding = GrpcClientBinding(client: _client);
        pubSub = GrpcClientPubSub(client: _client);
        invoker = GrpcClientInvoker(client: _client);
    }
  }
}
