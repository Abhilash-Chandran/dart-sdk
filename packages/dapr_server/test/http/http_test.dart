import 'dart:convert';

import 'package:dapr_common/dapr_common.dart';
import 'package:dapr_server/src/implementations/dapr_server.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

Future<void> main() async {
  /// Name of app provided while running the app.
  final appId = 'http-test-suite';

  /// Port where the server application is running.
  final serverPort = 3000;

  /// http port of the dapr sidecar.
  final daprPort = 3500;

  final daprServer = DaprServer(serverPort: serverPort, daprPort: daprPort);

  /// Name of the pub sub component deployed while runnng the dapr.
  /// check the `test/componets/pubsub-redis.yaml` file.
  final pubsubName = 'pubsub-redis';

  /// Our test suite should interact with the dapr sidecar not the server app
  /// itself.
  final baseUrl = 'http://localhost:$daprPort/v1.0';

  /// BaseUrl for invoke api
  final invokerBaseUrl = '$baseUrl/invoke/$appId/method';

  /// BaseUrl for invoke api
  /// https://docs.dapr.io/reference/api/pubsub_api/#http-request
  final publishBaseUrl = '$baseUrl/publish/$pubsubName';

  /// A mock Pubsub class to hold the call back function to be passed to the
  /// subscriber method of the dapr server.
  final mockTestPubSub = MockTestPubSub();

  /// Set of topic names to be used in the following tests
  final topicName1 = 'test-topic-1';

  var httpClient = http.Client();

  /// The dapr side car will be started by melos while running the tests.
  /// In order to debug the test
  /// Start the dapr sidecar manually using the following command and then run
  /// the tests.
  ///
  /// dapr run --app-id http-test-suite --app-protocol http --app-port 3000 --dapr-http-port 3500 --components-path ./test/components
  setUpAll(() async {
    // Setup Invoker related server configurations.
    await daprServer.invoker.listen(
      callback: (content) async {
        /// simulate delay of 2 seconds
        Future.delayed(Duration(seconds: 2));
        return 'Get Invoker invoked with ${content.body}';
      },
      methodName: 'test-invoker-get',
      callbackOptions: InvokerCallbackOptions(method: HttpMethod.get),
    );
    await daprServer.invoker.listen(
      callback: (content) async {
        /// simulate delay of 2 seconds
        Future.delayed(Duration(seconds: 2));
        return 'Post Invoker invoked with ${content.body}';
      },
      methodName: 'test-invoker-post',
      callbackOptions: InvokerCallbackOptions(method: HttpMethod.post),
    );
    await daprServer.invoker.listen(
      callback: (content) async {
        /// simulate delay of 2 seconds
        Future.delayed(Duration(seconds: 2));
        return 'Put Invoker invoked with ${content.body}';
      },
      methodName: 'test-invoker-put',
      callbackOptions: InvokerCallbackOptions(method: HttpMethod.put),
    );
    await daprServer.invoker.listen(
      callback: (content) async {
        /// simulate delay of 2 seconds
        Future.delayed(Duration(seconds: 2));
        return 'Delete Invoker invoked with ${content.body}';
      },
      methodName: 'test-invoker-delete',
      callbackOptions: InvokerCallbackOptions(method: HttpMethod.delete),
    );
    await daprServer.invoker.listen(
      callback: (content) async {
        /// simulate delay of 2 seconds
        Future.delayed(Duration(seconds: 2));
        return 'Invoker received params with ${content.query}';
      },
      methodName: 'test-invoker-params',
      callbackOptions: InvokerCallbackOptions(method: HttpMethod.get),
    );

    // Setup pubsub - register subscriptions.
    daprServer.pubsub.subscribe(
      pubSubName: pubsubName,
      topic: topicName1,
      callback: mockTestPubSub.testCallBack,
      route: 'route1',
    );
    await daprServer.startServer();
  });
  group('Invoker api tests', () {
    group('Test all http method types for invoker', () {
      test('Invoker for get method', () async {
        final methodName = 'test-invoker-get';
        final uri = Uri.parse('$invokerBaseUrl/$methodName');
        final resp = await httpClient.get(uri);
        expect(resp.body, 'Get Invoker invoked with ');
      });
      test('Invoker for post method', () async {
        final methodName = 'test-invoker-post';
        final testBody = {'hello': 'world'};
        final uri = Uri.parse('$invokerBaseUrl/$methodName');
        final resp = await httpClient.post(uri, body: jsonEncode(testBody));
        expect(resp.body, 'Post Invoker invoked with ${jsonEncode(testBody)}');
      });
      test('Invoker for put method', () async {
        final methodName = 'test-invoker-put';
        final testBody = {'hello': 'world'};
        final uri = Uri.parse('$invokerBaseUrl/$methodName');
        final resp = await httpClient.put(uri, body: jsonEncode(testBody));
        expect(resp.body, 'Put Invoker invoked with ${jsonEncode(testBody)}');
      });
      test('Invoker for delete method', () async {
        final methodName = 'test-invoker-delete';
        final testBody = {'hello': 'world'};
        final uri = Uri.parse('$invokerBaseUrl/$methodName');
        final resp = await httpClient.delete(uri, body: jsonEncode(testBody));
        expect(
            resp.body, 'Delete Invoker invoked with ${jsonEncode(testBody)}');
      });
    });

    test('query params is passed correctly', () async {
      final methodName = 'test-invoker-params';
      final testParams = {'param1': 'one', 'param2': '2'};
      final uri = Uri.parse(
          '$invokerBaseUrl/$methodName?${mapToQueryParams(testParams)}');

      final resp = await httpClient.get(uri);
      expect(resp.body, 'Invoker received params with $testParams');
    });
  });

  group('Test PubSub subscribe mechanism', () {
    test('Call back is called once', () async {
      when(mockTestPubSub.testCallBack(any)).thenAnswer((_) async {
        return PubSubResponse.success();
      });

      final uri = Uri.parse('$publishBaseUrl/$topicName1');
      final resp = await httpClient.post(uri, body: 'Hello World');

      /// Wait for the even to be processed.
      await Future.delayed(Duration(seconds: 1));
      verify(mockTestPubSub.testCallBack(any)).called(1);
    });
    test('Call back is called more than once', () async {
      when(mockTestPubSub.testCallBack(any)).thenAnswer((_) async {
        return PubSubResponse.success();
      });

      final uri = Uri.parse('$publishBaseUrl/$topicName1');
      // Publish messages three times
      await httpClient.post(uri, body: 'Hello World');
      await httpClient.post(uri, body: 'Hello World');
      await httpClient.post(uri, body: 'Hello World');

      /// Wait for the even to be processed.
      await Future.delayed(Duration(seconds: 1));

      /// Verify that the call back was called 3 times.
      verify(mockTestPubSub.testCallBack(any)).called(3);
    });
    test('Call back is called once', () async {
      when(mockTestPubSub.testCallBack(any)).thenAnswer((_) async {
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
    reset(mockTestPubSub);
    await daprServer.stop();
  });
}
