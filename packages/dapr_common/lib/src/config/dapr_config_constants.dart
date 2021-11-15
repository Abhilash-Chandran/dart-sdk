import '../../dapr_common.dart';

class DaprConf {
  static const String defAppHost = "127.0.0.1";
  static const String defDaprHost = "127.0.0.1";
  static const String defDaprHttpPort = "3500";
  static const String defDaprGrpcPort = "50001";
  static const String defDaprApiVersion = "v1.0";
  static const CommunicationProtocol defCommunicationProtocol =
      CommunicationProtocol.http;
  static const String defHttpAppPort = "3000";
  static const String defGrpcAppPort = "3000";
  static const int defHttpTimeout = 60;
}
