import 'package:dapr_client/src/implementation/client/dapr_client.dart';
import 'package:test/test.dart';

/// The tests in this file are organised based on the dapr api's sdk definition
/// from the following page.
///
/// https://docs.dapr.io/reference/api/
///
/// Any future tests should be placed in the respective group. Keeping them in
/// a single file allows to have a common setup.
///
/// If the number of tests are growing high then segregating them into seprate
/// files shall be considered.
void main() {
  /// local dapr host
  final daprHost = "127.0.0.1";
  /// local dapr sidecar port
  final daprPort = "50000";
  /// Define the common setup for all the tests.
  ///
  ///
  /// As of now the test servers against which the test will be run are setup manually.
  ///
  /// Once the server API is ready we can start the servers programatically.
  setUpAll(() {});
  group("Dapr Http Client - Service Invokation", () {
    test('Invoke a service', (){
      final daprClient = DaprClient(daprHost: daprHost, daprPort: daprPort);

    });

  });

  group("Dapr Http Client - State", body)
}
