import 'dart:convert';

import 'package:dapr_common/dapr_common.dart';
import 'package:dapr_server/src/implementations/dapr_server.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  /// Name of app provided while running the app.
  final appId = 'http-test-suite';

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
  final invokerBaseUrl = '$baseUrl/invoke/$appId/method';

  /// The dapr side car will be started by melos while running the tests.
  /// In order to debug the test
  /// Start the dapr sidecar manually using the following command and then run
  /// the tests.
  ///
  /// dapr run --app-id http-test-suite --app-protocol http --app-port 3000 --dapr-http-port 3500 --components-path ./test/components
  setUpAll(() async {
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

    await daprServer.startServer();
  });
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
      expect(resp.body, 'Delete Invoker invoked with ${jsonEncode(testBody)}');
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

  tearDownAll(() async {
    await daprServer.stop();
  });
}
