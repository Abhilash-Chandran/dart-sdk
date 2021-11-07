import 'dart:math';

import 'package:dapr_client/src/enums/communication_protocol.dart';
import 'package:dapr_client/src/implementation/client/dapr_client.dart';
import 'package:dapr_client/src/models/generated/secret_models.dart';
import 'package:dapr_client/src/models/generated/state_models.dart';
import 'package:test/test.dart';

/// The tests in this file are organised based on the dapr api's sdk definition
/// from the following page.
///
/// https://docs.dapr.io/reference/api/
///
/// Any future tests should be placed in the respective group. Keeping them in
/// a single file allows to have a common setup.
///
/// If the number of tests are growing high then segregating them into seprate
/// files shall be considered.
void main() {
  /// local dapr host
  final daprHost = "127.0.0.1";

  /// local dapr sidecar port
  final daprPort = "50000";

  /// Common dapr client instance to run all the tests.
  late final DaprClient daprClient;

  /// Define the common setup for all the tests.
  setUpAll(() {
    daprClient = DaprClient(
      daprHost: daprHost,
      daprPort: daprPort,
      communicationProtocol: CommunicationProtocol.grpc,
    );
  });

  group('Dapr Http Client - Secret', () {
    // Note the secrets for this test are provided as env variables while
    // running the tests.
    //
    // Check melos.yaml in the root directory and the script named
    // test:client:e2e:http
    var secretStoreName = 'secret-envvars';
    test('Get secret for a single key', () async {
      final result = await daprClient.secret.get(
        secretStoreName: secretStoreName,
        key: 'TEST_SECRET_1',
      );
      expect(result, {'TEST_SECRET_1': 'secret_val_1'});
    });
    test('Get bulk secrets', () async {
      final result = await daprClient.secret.getBulk(
        secretStoreName: secretStoreName,
      );
      // verrify if the first secret is present
      expect(
        result,
        containsPair(
          'TEST_SECRET_1',
          SecretResponse(secrets: {'TEST_SECRET_1': 'secret_val_1'}),
        ),
      );
      // verrify if the second secret is present
      expect(
        result,
        containsPair(
          'TEST_SECRET_2',
          SecretResponse(secrets: {'TEST_SECRET_2': 'secret_val_2'}),
        ),
      );
    });
  });

  /// To avoid dependencies between tests each test should create its own
  /// Key/Value pairs and perform the tests.
  group("Dapr Grpc Client - State", () {
    var storeName = 'state-redis';
    test("Save State", () async {
      // Prepare the state to be stored
      final stateObjects = [
        SaveStateItem(key: 'key-1', value: 'value-1'),
        SaveStateItem(key: 'key-2', value: 'value-2'),
        SaveStateItem(key: 'key-3', value: 'value-3'),
      ];

      // Invoke state save logic
      await daprClient.state
          .save(storeName: storeName, stateObjects: stateObjects);

      // Verify if the state is store appropriately
      final fetchedState =
          await daprClient.state.get(storeName: storeName, key: 'key-1');

      expect(
        fetchedState,
        'value-1',
      );
    });

    test("Get state in bulk", () async {
      // Prepare the state to be stored
      final stateObjects = [
        SaveStateItem(key: 'key-1', value: 'value-1'),
        SaveStateItem(key: 'key-2', value: 'value-2'),
      ];
      // Invoke state save logic
      await daprClient.state
          .save(storeName: storeName, stateObjects: stateObjects);
      // Prepare result to compare
      final bulkStateObjects = [
        BulkStateItem(key: 'key-1', data: 'value-1', etag: '1'),
        BulkStateItem(key: 'key-2', data: 'value-2', etag: '1'),
      ];
      final result = await daprClient.state
          .getBulk(storeName: storeName, keys: ['key-1', 'key-2']);
      expect(result, unorderedEquals(result));
    });

    test('Delete state', () async {
      // Prepare the state to be stored
      final stateObjects = [
        SaveStateItem(key: 'key-1', value: 'value-1'),
        SaveStateItem(key: 'key-2', value: 'value-2'),
      ];
      // Invoke state save logic
      await daprClient.state
          .save(storeName: storeName, stateObjects: stateObjects);

      // Delete the state item
      await daprClient.state.delete(storeName: storeName, key: 'key-3');

      // fetch the deleted key and verify that its not present
      final result =
          await daprClient.state.get(storeName: storeName, key: 'key-3');

      expect(result, isEmpty);
    });

    test('Save Numeric, boolean and Map values', () async {
      final stateObjects = [
        SaveStateItem(key: 'key-1', value: 'value-1'),
        SaveStateItem(key: 'key-2', value: 2),
        SaveStateItem(key: 'key-3', value: true),
        SaveStateItem(key: 'key-4', value: {
          'person': {
            'firstName': 'john',
            'lastName': 'doe',
          }
        }),
      ];

      // Invoke state save logic
      await daprClient.state
          .save(storeName: storeName, stateObjects: stateObjects);

      // Verify if all the states are stored appropriately
      final fetchedState = await Future.wait([
        daprClient.state.get(storeName: storeName, key: 'key-1'),
        daprClient.state.get(storeName: storeName, key: 'key-2'),
        daprClient.state.get(storeName: storeName, key: 'key-3'),
        daprClient.state.get(storeName: storeName, key: 'key-4'),
      ]);

      final expectedStates = [
        'value-1',
        2,
        true,
        {
          'person': {
            'firstName': 'john',
            'lastName': 'doe',
          }
        },
      ];
      expect(
        fetchedState,
        expectedStates,
      );
    });

    test('Bulk state retrieval - Numeric, String, boolean, Map values',
        () async {
      // Define the state values.
      final value1 = 'value-1';
      final value2 = 2;
      final value3 = true;
      final value4 = {
        'person': {
          'firstName': 'john',
          'lastName': 'doe',
          'age': 23,
          'real': false,
          'weight': 55.5,
          'hobbies': ['TT', 'AB', 'BC', 2]
        }
      };
      final stateObjects = [
        SaveStateItem(key: 'key-1', value: value1),
        SaveStateItem(key: 'key-2', value: value2),
        SaveStateItem(key: 'key-3', value: value3),
        SaveStateItem(key: 'key-4', value: value4),
      ];

      // Invoke state save logic
      await daprClient.state
          .save(storeName: storeName, stateObjects: stateObjects);

      // Verify if all the states are stored appropriately
      final fetchedStates = await daprClient.state.getBulk(
          storeName: storeName, keys: ['key-1', 'key-2', 'key-3', 'key-4']);

      final expectedStates = [
        BulkStateItem(key: 'key-1', data: value1, etag: '1'),
        BulkStateItem(key: 'key-2', data: value2, etag: '1'),
        BulkStateItem(key: 'key-3', data: value3, etag: '1'),
        BulkStateItem(key: 'key-4', data: value4, etag: '1'),
      ];
      expect(
        fetchedStates,
        unorderedEquals(expectedStates),
      );
    });

    test('Delete a nested key/value sate', () async {
      final value4 = {
        'person': {
          'firstName': 'john',
          'lastName': 'doe',
          'age': 23,
          'real': false,
          'weight': 55.5,
          'hobbies': ['TT', 'AB', 'BC', 2]
        }
      };
      final stateObjects = [
        SaveStateItem(key: 'key-4', value: value4),
      ];
      // Invoke state save logic
      await daprClient.state
          .save(storeName: storeName, stateObjects: stateObjects);
      // Delete key state
      await daprClient.state.delete(storeName: storeName, key: 'key-4');

      // Fetch the state and verify its empty
      final result =
          await daprClient.state.get(storeName: storeName, key: 'key-4');
      expect(result, isEmpty);
    });

    test('State Transaction - Update key/value and delete another key',
        () async {
      // Insert two key value pairs to the state store.
      final stateObjects = [
        SaveStateItem(key: 'key-1', value: 'value-1'),
        SaveStateItem(key: 'key-2', value: 'value-2'),
        SaveStateItem(key: 'key-3', value: 'value-3'),
      ];

      // Invoke state save logic
      await daprClient.state
          .save(storeName: storeName, stateObjects: stateObjects);
      await daprClient.state.transaction(storeName: storeName, operations: [
        StateOperation(
          operation: 'upsert',
          request:
              StateOperationRequest(key: 'key-1', value: 'updated-value-1'),
        ),
        StateOperation(
          operation: 'upsert',
          request:
              StateOperationRequest(key: 'key-2', value: 'updated-value-2'),
        ),
        StateOperation(
          operation: 'delete',
          request: StateOperationRequest(key: 'key-3'),
        ),
      ]);

      // Fetch the state and verify its empty
      final val1 =
          await daprClient.state.get(storeName: storeName, key: 'key-1');
      final val2 =
          await daprClient.state.get(storeName: storeName, key: 'key-2');
      final val3 =
          await daprClient.state.get(storeName: storeName, key: 'key-3');
      expect(val1, 'updated-value-1');
      expect(val2, 'updated-value-2');
      expect(val3, '');
    });
    // Removes all the keys/values stored in the state store.
    // Any future tests involving different keys should be removed here.
    tearDown(() async {
      await daprClient.state.delete(storeName: storeName, key: 'key-1');
      await daprClient.state.delete(storeName: storeName, key: 'key-2');
      await daprClient.state.delete(storeName: storeName, key: 'key-3');
      await daprClient.state.delete(storeName: storeName, key: 'key-4');
    });
  });
}
