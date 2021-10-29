import 'dart:async';
import 'package:dapr_client/src/models/generated/state_models.dart';

// import '../../typedefs/all_type_def.dart';

abstract class ClientState {
  Future<void> save({
    required String storeName,
    required List<SaveStateItem> stateObjects,
  });

  ///
  ///
  /// Todo: Think about making the return as Union of Map and String. Perhaps using Freezed!
  ///
  Future<Map<String, dynamic>> get({
    required String storeName,
    required String key,
    // todo: add options for passing metadata and state options
    // StateOptions? options,
  });

  Future<List<Map<String, dynamic>>> getBulk({
    required String storeName,
    required List<String> keys,
    int? parallelism,
    // todo: add options for passing metadata and state options
    // String? metadata,
  });

  Future<void> delete({
    required String storeName,
    required String key,
    // todo: add options for passing metadata and state options
    // StateOptions? options,
  });

  Future<void> transaction({
    required String storeName,
    List<StateOperation>? operations,
    Map<String, dynamic>? metadata,
  });
}

// export default interface IClientState {
//     save(storeName: string, stateObjects: KeyValuePairType[]): Promise<void>;
//     get(storeName: string, key: string): Promise<KeyValueType | string>;
//     getBulk(storeName: string, keys: string[], parallelism?: number, metadata?: string): Promise<KeyValueType[]>;
//     delete(storeName: string, key: string): Promise<void>;
//     transaction(storeName: string, operations?: OperationType[], metadata?: IRequestMetadata | null): Promise<void>;
// }
