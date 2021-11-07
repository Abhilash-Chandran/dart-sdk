import 'package:dapr_client/src/abstractions/client/client_secrets.dart';
import 'package:dapr_client/src/implementation/client/grpc/grpc_client.dart';
import 'package:dapr_client/src/models/generated/secret_models.dart';
import 'package:dapr_proto/dapr_proto.dart' as dp;

class GrpcClientSecret implements ClientSecret {
  final DaprGrpcClient daprGrpcClient;

  /// Note this is DaprClient from the dapr_proto package which enables a
  /// client communication with the dapr grpc sidecar server.
  late final dp.DaprClient _daprClient;
  GrpcClientSecret({required this.daprGrpcClient}) {
    _daprClient = daprGrpcClient.client;
  }

  @override
  Future<Map<String, dynamic>> get({
    required String secretStoreName,
    required String key,
    Map<String, String>? metadata,
  }) async {
    final _getSecretRequest = dp.GetSecretRequest(
      key: key,
      storeName: secretStoreName,
      metadata: metadata,
    );

    final _grpcResponse = await _daprClient.getSecret(_getSecretRequest);
    return _grpcResponse.data;
  }

  @override
  Future<Map<String, SecretResponse>> getBulk({
    required String secretStoreName,
    Map<String, String>? metadata,
  }) async {
    final _getBulkSecretRequest = dp.GetBulkSecretRequest(
      storeName: secretStoreName,
    );
    final _bulkSecretResponse =
        await _daprClient.getBulkSecret(_getBulkSecretRequest);
    final _responseBulkSecrets = <String, SecretResponse>{};
    for (var bulkSecret in _bulkSecretResponse.data.entries) {
      _responseBulkSecrets.putIfAbsent(
        bulkSecret.key,
        () => SecretResponse(
          secrets: bulkSecret.value.secrets,
        ),
      );
    }
    return _responseBulkSecrets;
  }
}