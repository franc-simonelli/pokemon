part of 'download_cubit.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    required Status statusDonwload,
    int? totalNumber,
  }) = _DownloadState;
}
