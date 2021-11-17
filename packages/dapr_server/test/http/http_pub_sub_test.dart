import 'package:dapr_common/dapr_common.dart';
import 'package:dapr_server/src/implementations/dapr_server.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  /// Name of the pub sub component deployed while runnng the dapr.
  /// check the `test/componets/pubsub-redis.yaml` file.
  final pubsubName = 'pubsub-redis';

  /// Port where the server application is running.
  final serverPort = 3000;

  /// http port of the dapr sidecar.
  final daprPort = 3500;

  final daprServer = DaprServer(serverPort: serverPort, daprPort: daprPort);
  var httpClient = http.Client();

  /// Our test suite should interact with the dapr sidecar not the server app
  /// itself.
  final baseUrl = 'http://localhost:$daprPort/v1.0';

  /// BaseUrl for invoke api
  /// https://docs.dapr.io/reference/api/pubsub_api/#http-request
  final publishBaseUrl = '$baseUrl/publish/$pubsubName';

  /// A mock Pubsub class to hold the call back function to be passed to the
  /// subscriber method of the dapr server.
  final mockTestPubSub = MockTestPubSub();

  /// Set of topic names to be used in the following tests
  final topicName1 = 'test-topic-1';
  final topicName2 = 'test-topic-2';
  final topicName3 = 'test-topic-3';

  /// The dapr side car will be started by melos while running the tests.
  /// In order to debug the test
  /// Start the dapr sidecar manually using the following command and then run
  /// the tests.
  ///
  /// dapr run --app-id http-test-suite --app-protocol http --app-port 3000 --dapr-http-port 3500 --components-path ./test/components
  setUpAll(() async {
    daprServer.pubsub.subscribe(
      pubSubName: pubsubName,
      topic: topicName1,
      callback: mockTestPubSub.testCallBack,
      route: 'route1',
    );
    daprServer.pubsub.subscribe(
      pubSubName: pubsubName,
      topic: topicName2,
      callback: mockTestPubSub.testCallBack,
      route: 'route2',
    );
    daprServer.pubsub.subscribe(
      pubSubName: pubsubName,
      topic: topicName3,
      callback: mockTestPubSub.testCallBack,
      route: 'route3',
    );
    await daprServer.startServer();
  });
  group('Test PubSub subscribe mechanism', () {
    test('Call back is called once', () async {
      when(mockTestPubSub.testCallBack(any)).thenAnswer((_) async {
        print('I am called once.');
        return PubSubResponse.success();
      });

      final uri = Uri.parse('$publishBaseUrl/$topicName1');
      final resp = await httpClient.post(uri, body: 'Hello World');

      /// Wait for the even to be processed.
      await Future.delayed(Duration(seconds: 1));
      verify(mockTestPubSub.testCallBack(any)).called(1);
    });
  });

  tearDownAll(() async {
    await daprServer.stop();
  });
}
