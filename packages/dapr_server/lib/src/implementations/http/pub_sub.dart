import 'dart:convert';

import 'package:dapr_common/dapr_common.dart';
import 'package:dapr_common/src/models/server/server_type_definitions.dart';
import 'package:dapr_server/src/abstractions/server_pub_sub.dart';
import 'package:shelf_plus/shelf_plus.dart';

class HttpPubSub implements ServrePubSub {
  /// The router plus handler to which the new routes related to pubsub will
  /// be added.
  final RouterPlus pubSubHandler = RouterPlus();

  /// Holds a list of routes mapped to a one or more topics in one or more
  /// deployed pubsub components
  final List<PubSubRoute> pubSubRoutes = <PubSubRoute>[];

  HttpPubSub() {
    pubSubHandler.get('/dapr/subscribe', (req) async {
      final result = jsonEncode(pubSubRoutes);
      print(result);
      return Response.ok(result);
    });
  }

  @override
  Future<void> subscribe({
    required String pubSubName,
    required String topic,
    required PubSubCallback callback,
    String? route,
    bool rawEvents = false,
  }) async {
    final _route = route ?? 'route-$pubSubName-$topic';
    // Add the pub sub route to the list. This list will used for the
    // `dapr/subscribe` route.
    pubSubRoutes.add(
      PubSubRoute(
        pubSubName: pubSubName,
        topic: topic,
        route: _route,
        metadata: {
          'rawPayload': rawEvents.toString(),
        },
      ),
    );
    print('added subscriptions $pubSubRoutes');
    pubSubHandler.add(
      'post',
      '/$_route',
      (Request request) async {
        try {
          final body = await request.body.asString;
          final result = await callback(body);
          // Send back response to dapr.
          //  ref: https://github.com/dapr/go-sdk/blob/d9ad49d2a6/service/http/topic.go#L186
          // https://github.com/dapr/go-sdk/blob/d9ad49d2a6/service/http/topic.go#L186
          print('Result inside handler $result');
          return result.when(
            success: () => Response.ok(jsonEncode({'status': 'SUCCESS'})),
            drop: () => Response.ok(jsonEncode({'status': 'DROP'})),
            retry: () => Response.ok(jsonEncode({'status': 'RETRY'})),
            error: () => Response.internalServerError(),
          );
        } on Exception {
          return Response.internalServerError();
        }
      },
    );

    print(
        'registering /$_route for subscriptio topic $topic in pub sub $pubSubName');
  }
}
