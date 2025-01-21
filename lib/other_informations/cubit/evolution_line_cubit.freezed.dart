// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evolution_line_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EvolutionLineState {
  List<String> get evolutionLineId => throw _privateConstructorUsedError;
  List<PokemonModel> get evolutionLine => throw _privateConstructorUsedError;
  Status get evolutionLineStatus => throw _privateConstructorUsedError;

  /// Create a copy of EvolutionLineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvolutionLineStateCopyWith<EvolutionLineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvolutionLineStateCopyWith<$Res> {
  factory $EvolutionLineStateCopyWith(
          EvolutionLineState value, $Res Function(EvolutionLineState) then) =
      _$EvolutionLineStateCopyWithImpl<$Res, EvolutionLineState>;
  @useResult
  $Res call(
      {List<String> evolutionLineId,
      List<PokemonModel> evolutionLine,
      Status evolutionLineStatus});
}

/// @nodoc
class _$EvolutionLineStateCopyWithImpl<$Res, $Val extends EvolutionLineState>
    implements $EvolutionLineStateCopyWith<$Res> {
  _$EvolutionLineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EvolutionLineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evolutionLineId = null,
    Object? evolutionLine = null,
    Object? evolutionLineStatus = null,
  }) {
    return _then(_value.copyWith(
      evolutionLineId: null == evolutionLineId
          ? _value.evolutionLineId
          : evolutionLineId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      evolutionLine: null == evolutionLine
          ? _value.evolutionLine
          : evolutionLine // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      evolutionLineStatus: null == evolutionLineStatus
          ? _value.evolutionLineStatus
          : evolutionLineStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvolutionLineStateImplCopyWith<$Res>
    implements $EvolutionLineStateCopyWith<$Res> {
  factory _$$EvolutionLineStateImplCopyWith(_$EvolutionLineStateImpl value,
          $Res Function(_$EvolutionLineStateImpl) then) =
      __$$EvolutionLineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> evolutionLineId,
      List<PokemonModel> evolutionLine,
      Status evolutionLineStatus});
}

/// @nodoc
class __$$EvolutionLineStateImplCopyWithImpl<$Res>
    extends _$EvolutionLineStateCopyWithImpl<$Res, _$EvolutionLineStateImpl>
    implements _$$EvolutionLineStateImplCopyWith<$Res> {
  __$$EvolutionLineStateImplCopyWithImpl(_$EvolutionLineStateImpl _value,
      $Res Function(_$EvolutionLineStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EvolutionLineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evolutionLineId = null,
    Object? evolutionLine = null,
    Object? evolutionLineStatus = null,
  }) {
    return _then(_$EvolutionLineStateImpl(
      evolutionLineId: null == evolutionLineId
          ? _value._evolutionLineId
          : evolutionLineId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      evolutionLine: null == evolutionLine
          ? _value._evolutionLine
          : evolutionLine // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      evolutionLineStatus: null == evolutionLineStatus
          ? _value.evolutionLineStatus
          : evolutionLineStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$EvolutionLineStateImpl implements _EvolutionLineState {
  const _$EvolutionLineStateImpl(
      {required final List<String> evolutionLineId,
      required final List<PokemonModel> evolutionLine,
      required this.evolutionLineStatus})
      : _evolutionLineId = evolutionLineId,
        _evolutionLine = evolutionLine;

  final List<String> _evolutionLineId;
  @override
  List<String> get evolutionLineId {
    if (_evolutionLineId is EqualUnmodifiableListView) return _evolutionLineId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolutionLineId);
  }

  final List<PokemonModel> _evolutionLine;
  @override
  List<PokemonModel> get evolutionLine {
    if (_evolutionLine is EqualUnmodifiableListView) return _evolutionLine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolutionLine);
  }

  @override
  final Status evolutionLineStatus;

  @override
  String toString() {
    return 'EvolutionLineState(evolutionLineId: $evolutionLineId, evolutionLine: $evolutionLine, evolutionLineStatus: $evolutionLineStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvolutionLineStateImpl &&
            const DeepCollectionEquality()
                .equals(other._evolutionLineId, _evolutionLineId) &&
            const DeepCollectionEquality()
                .equals(other._evolutionLine, _evolutionLine) &&
            (identical(other.evolutionLineStatus, evolutionLineStatus) ||
                other.evolutionLineStatus == evolutionLineStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_evolutionLineId),
      const DeepCollectionEquality().hash(_evolutionLine),
      evolutionLineStatus);

  /// Create a copy of EvolutionLineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvolutionLineStateImplCopyWith<_$EvolutionLineStateImpl> get copyWith =>
      __$$EvolutionLineStateImplCopyWithImpl<_$EvolutionLineStateImpl>(
          this, _$identity);
}

abstract class _EvolutionLineState implements EvolutionLineState {
  const factory _EvolutionLineState(
      {required final List<String> evolutionLineId,
      required final List<PokemonModel> evolutionLine,
      required final Status evolutionLineStatus}) = _$EvolutionLineStateImpl;

  @override
  List<String> get evolutionLineId;
  @override
  List<PokemonModel> get evolutionLine;
  @override
  Status get evolutionLineStatus;

  /// Create a copy of EvolutionLineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvolutionLineStateImplCopyWith<_$EvolutionLineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
