import 'dart:convert';

import 'package:dapr_client/src/abstractions/client/client_secrets.dart';
import 'package:dapr_client/src/enums/http_method.dart';
import 'package:dapr_client/src/implementation/client/http/http_client.dart';
import 'package:dapr_client/src/models/generated/secret_models.dart';
import 'package:dapr_client/src/utils/utils.dart';

class HttpClientSecret implements ClientSecret {
  final DaprHttpClient daprHttpClient;
  HttpClientSecret({required this.daprHttpClient});

  @override
  Future<Map<String, dynamic>> get({
    required String secretStoreName,
    required String key,
    Map<String, String>? metadata,
  }) async {
    final _queryParams = mapToQueryParams(metadata ?? {});
    final result = await daprHttpClient.executeDaprApiCall(
      apiUrl:
          '/secrets/$secretStoreName/$key${_queryParams.isEmpty ? _queryParams : '?$_queryParams'}',
      httpMethod: HttpMethod.get,
    );
    return jsonDecode(result);
  }

  @override
  Future<Map<String, SecretResponse>> getBulk({
    required String secretStoreName,
    Map<String, String>? metadata,
  }) async {
    final result = await daprHttpClient.executeDaprApiCall(
        apiUrl: '/secrets/$secretStoreName/bulk',
        httpMethod: HttpMethod.get,
        headers: {
          'Content-Type': 'application/json',
        });
    final _decodedResponse = jsonDecode(result) as Map<String, dynamic>;    
    final _responseBulkSecrets = <String, SecretResponse>{};
    for (var bulkSecret in _decodedResponse.entries) {
      _responseBulkSecrets.putIfAbsent(
        bulkSecret.key,
        () => SecretResponse(secrets: bulkSecret.value as Map<String, dynamic>),
      );
    }
    return _responseBulkSecrets;
  }
}
