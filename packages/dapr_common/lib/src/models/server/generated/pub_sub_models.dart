import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_sub_models.freezed.dart';
part 'pub_sub_models.g.dart';

@freezed
class PubSubRoute with _$PubSubRoute {
  const factory PubSubRoute({
    /// The component name configured in a component yaml file.
    required String pubSubName,

    /// The name of the topic to Publish/Subscribe to.
    required String topicName,

    /// The http route name for associated with this topic.
    ///
    /// This name is primarily used for a Http server where the event from the
    /// topic will forwared to this http route built automatically.
    required String route,
  }) = _PubSubRoute;

  factory PubSubRoute.fromJson(Map<String, dynamic> json) =>
      _$PubSubRouteFromJson(json);
}
