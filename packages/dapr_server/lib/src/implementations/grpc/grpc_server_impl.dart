import 'dart:convert';

import 'package:dapr_common/dapr_common.dart';
import 'package:dapr_proto/dapr_proto.dart';
import 'package:grpc/service_api.dart';

/// An implementation of grpc runtime services defined by Dapr.
///
/// This implemention allows creating Daprised service using grpc protocol.
class GrpcServerImplementation extends AppCallbackServiceBase {
  /// A map for holding invoker callbacks
  Map<String, InvokerCallback> invokerCallbackMap = {};

  /// A map for holding pubsub callbacks
  Map<PubSubRoute, PubSubCallback> pubSubCallbackMap = {};

  /// A map for holding bindings callbacks
  Map<String, BindingCallback> bindingsCallbackMap = {};

  @override
  Future<ListInputBindingsResponse> listInputBindings(
    ServiceCall call,
    Empty request,
  ) async {
    var bindingNames = bindingsCallbackMap.keys;
    bindingNames = bindingNames.isEmpty ? [] : bindingNames;
    return ListInputBindingsResponse(
      bindings: bindingNames,
    );
  }

  @override
  Future<ListTopicSubscriptionsResponse> listTopicSubscriptions(
      ServiceCall call, Empty request) async {
    var subscriptions = <TopicSubscription>[];
    for (var pubSubRoute in pubSubCallbackMap.keys) {
      subscriptions.add(
        TopicSubscription(
          pubsubName: pubSubRoute.pubSubName,
          metadata: pubSubRoute.metadata,
          topic: pubSubRoute.topic,
          // TODO: Verify if routes needs to be set here. In go-sdk routes are
          //  not set. Neither in js-sdk.
          //
          // Currently not setting routes.
          // As per the specifitcation Dapr only needs to know the topics which
          // are being subscribed by the service.
          // The route information comes in the [TopicEventRequest] passed in
          // onTopicEvent which contains the route information which can then
          // be parsed and mapped to the correct callback.
          //
          // routes: TopicRoutes(default_2: e.route),
        ),
      );
    }
    return ListTopicSubscriptionsResponse(
      subscriptions: subscriptions,
    );
  }

  @override
  Future<BindingEventResponse> onBindingEvent(
      ServiceCall call, BindingEventRequest request) {
    // TODO: implement onBindingEvent
    throw UnimplementedError();
  }

  @override
  Future<InvokeResponse> onInvoke(
      ServiceCall call, InvokeRequest request) async {
    final methodName = request.method.toLowerCase();
    final httpMethod = request.httpExtension.verb.name.toLowerCase();
    final cbKey = '$methodName-$httpMethod';

    if (invokerCallbackMap.containsKey(cbKey)) {
      final _callBack = invokerCallbackMap[cbKey];
      final _body = utf8.decode(request.data.value);
      final queryMap = queryParamStringToMap(request.httpExtension.querystring);
      final _result = await _callBack!(
        InvokerCallbackContent(
          body: _body,
          query: queryMap,
          metadata: InvokerCallbackMetadata(
            contentType: request.contentType,
          ),
        ),
      );
      final respData = _result is String ? _result : jsonEncode(_result);
      final invokeResponse = InvokeResponse(
        data: Any(
          value: utf8.encode(respData),
        ),
        contentType: 'application/json',
      );
      return invokeResponse;
    }

    throw UnimplementedError('Requested method $methodName is not implemented');
  }

  @override
  Future<TopicEventResponse> onTopicEvent(
      ServiceCall call, TopicEventRequest request) {
    // TODO: implement onTopicEvent
    throw UnimplementedError();
  }
}
