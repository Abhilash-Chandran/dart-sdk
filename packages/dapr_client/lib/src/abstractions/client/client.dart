import 'package:dapr_common/dapr_common.dart';

/// An abstract client which exposes client related information.
///
/// Will be implemented by the respective clients such as [HttpClient] and [GrpcClient].
abstract class Client {
  get client;
  String get clientHost;
  String get clientPort;
  CommunicationProtocol get communicationProtocol;
}
