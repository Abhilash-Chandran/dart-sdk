import 'package:dapr_client/src/enums/communication_protocol.dart';

class DaprConf {
  static final String defDaprHost = "127.0.0.1";
  static final String defDaprHttpPort = "3500";
  static final String defDaprGrpcPort = "50001";
  static final String defDaprApiVersion = "v1.0";
  static final CommunicationProtocol defCommunicationProtocol =
      CommunicationProtocol.http;
  static final String defHttpAppPort = "3000";
  static final String defGrpcAppPort = "3000";
  static final int defHttpTimeout = 60;
}
