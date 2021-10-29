abstract class ClientSecret {
  Future<Object> get({
    required String secretStoreName,
    required String key,
    String? metadata,
  });

  Future<Object> getBulk({
    required String secretStoreName,
  });
}

// export default interface IClientSecret {
//     get(secretStoreName: string, key: string, metadata?: string): Promise<object>;
//     getBulk(secretStoreName: string): Promise<object>;
// }