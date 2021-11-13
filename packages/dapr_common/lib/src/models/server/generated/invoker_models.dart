import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enum/http_method.dart';

part 'invoker_models.freezed.dart';
part 'invoker_models.g.dart';

@freezed
class InvokerCallbackContent with _$InvokerCallbackContent {
  const factory InvokerCallbackContent({
    String? body,
    String? query,
    String? metadata,
    HttpMethod? method,
  }) = _InvokerCallbackContent;

  factory InvokerCallbackContent.fromJson(Map<String, dynamic> json) =>
      _$InvokerCallbackContentFromJson(json);
}
