import 'dart:convert';

import 'package:dapr_client/src/abstractions/client/client_state.dart';
import 'package:dapr_client/src/enums/http_method.dart';
import 'package:dapr_client/src/implementation/client/http/http_client.dart';
import 'package:dapr_client/src/models/generated/state_models.dart';

class HttpClientState implements ClientState {
  final DaprHttpClient daprHttpClient;
  HttpClientState({required this.daprHttpClient});

  @override
  Future<void> delete({required String storeName, required String key}) async {
    await daprHttpClient.executeDaprApiCall(
      apiUrl: '/state/$storeName/$key',
      httpMethod: HttpMethod.delete,
    );
  }

  @override
  Future<dynamic> get({required String storeName, required String key}) async {
    final _result = await daprHttpClient.executeDaprApiCall(
      apiUrl: '/state/$storeName/$key',
      httpMethod: HttpMethod.get,
    );
    final finalResult = _result.isEmpty ? _result : jsonDecode(_result);
    return finalResult;
  }

  @override
  Future<void> save(
      {required String storeName,
      required List<SaveStateItem> stateObjects}) async {
    await daprHttpClient.executeDaprApiCall(
      apiUrl: '/state/$storeName',
      httpMethod: HttpMethod.post,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(stateObjects),
    );
  }

  @override
  Future<List<BulkStateItem>> getBulk({
    required String storeName,
    required List<String> keys,
    int parallelism = 10,
    Map<String, String> metadata = const {},
  }) async {
    try {
      final encodedBody = jsonEncode(
        {
          'keys': keys,
          'parallelism': parallelism,
        },
      );
      // Convert metadata map into query parameters.
      var metadataString = '';
      for (var entry in metadata.entries) {
        metadataString += '${entry.key}=${entry.value}';
      }
      final result = await daprHttpClient.executeDaprApiCall(
        apiUrl:
            '/state/$storeName/bulk${metadataString.isEmpty ? metadataString : '?$metadataString'}',
        httpMethod: HttpMethod.post,
        headers: {
          'Content-Type': 'application/json',
        },
        body: encodedBody,
      );
      // Return an empty array if no values are found for the provided keys.
      final bulkStateItems = <BulkStateItem>[];

      // Fill the empty array with [SaveStateItem] objects extracted from the result.
      if (result.isNotEmpty) {
        final decodeResult = jsonDecode(result) as List<dynamic>;
        for (var element in decodeResult) {
          bulkStateItems.add(BulkStateItem.fromJson(element));
        }
      }
      return bulkStateItems;
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<void> transaction(
      {required String storeName,
      List<StateOperation>? operations,
      Map<String, String>? metadata}) async {
    final encodedBody = jsonEncode(
      {
        'operations': operations,
        'metadata': metadata,
      },
    );
    await daprHttpClient.executeDaprApiCall(
      apiUrl: '/state/$storeName/transaction',
      httpMethod: HttpMethod.post,
      headers: {'Content-Type': 'application/json'},
      body: encodedBody,
    );
  }
}
