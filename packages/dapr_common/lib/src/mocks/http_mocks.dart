import 'package:dapr_common/dapr_common.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([TestPubSub])
abstract class TestPubSub {
  Future<PubSubResponse> testCallBack(dynamic data);
}
