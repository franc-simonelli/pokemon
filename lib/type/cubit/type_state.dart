part of 'type_cubit.dart';

@freezed
class TypeState with _$TypeState {
  const factory TypeState({
    required List<String> allTypes,
    required List<String> typesSelect,
  }) = _TypeState;
}
