abstract class ClientBinding {
  Future<Object> send({
    required String bindingName,
    required String operation,
    required dynamic data,
    Object? metadata,
  });
}

// export default interface IClientBinding {
//     send(bindingName: string, operation: string, data: any, metadata?: object): Promise<object>;
// }