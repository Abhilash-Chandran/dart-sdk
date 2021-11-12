import 'package:dapr_server/src/enums/http_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoker_models.freezed.dart';
part 'invoker_models.g.dart';

@freezed
class InvokerCallbackContent with _$InvokerCallbackContent{
  const factory InvokerCallbackContent({
    String? body,
    String? query,
    String? metadata,
    HttpMethod? method,
  }) = _InvokerCallbackContent;
}
