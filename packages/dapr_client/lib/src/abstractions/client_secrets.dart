import 'package:dapr_common/dapr_common.dart';

abstract class ClientSecret {
  Future<Map<String, dynamic>> get({
    required String secretStoreName,
    required String key,
    Map<String, String>? metadata,
  });

  Future<Map<String, SecretResponse>> getBulk({
    required String secretStoreName,
    Map<String, String>? metadata,
  });
}

// export default interface IClientSecret {
//     get(secretStoreName: string, key: string, metadata?: string): Promise<object>;
//     getBulk(secretStoreName: string): Promise<object>;
// }