import 'package:dapr_common/dapr_common.dart';

/// Class defining the methods to create Inputbindings.
abstract class ServerBinding {
  /// A method to setup the input binding using a callback method of type
  /// [BindingCallback].
  Future<dynamic> receive(String bindingName, BindingCallback callback);
}
