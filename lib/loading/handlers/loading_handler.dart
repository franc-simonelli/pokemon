import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_handler.freezed.dart';

@freezed
class LoadingHandler with _$LoadingHandler {
  factory LoadingHandler.fullscreen({
    required String idLoading,
  }) = _FullScreen;

  factory LoadingHandler.custom({
    required String idLoading,
  }) = _Custom;
}
