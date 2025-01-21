// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moveset_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovesetState {
  Status get status => throw _privateConstructorUsedError;
  MovesetModel? get moveset => throw _privateConstructorUsedError;

  /// Create a copy of MovesetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovesetStateCopyWith<MovesetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovesetStateCopyWith<$Res> {
  factory $MovesetStateCopyWith(
          MovesetState value, $Res Function(MovesetState) then) =
      _$MovesetStateCopyWithImpl<$Res, MovesetState>;
  @useResult
  $Res call({Status status, MovesetModel? moveset});
}

/// @nodoc
class _$MovesetStateCopyWithImpl<$Res, $Val extends MovesetState>
    implements $MovesetStateCopyWith<$Res> {
  _$MovesetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovesetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? moveset = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      moveset: freezed == moveset
          ? _value.moveset
          : moveset // ignore: cast_nullable_to_non_nullable
              as MovesetModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovesetStateImplCopyWith<$Res>
    implements $MovesetStateCopyWith<$Res> {
  factory _$$MovesetStateImplCopyWith(
          _$MovesetStateImpl value, $Res Function(_$MovesetStateImpl) then) =
      __$$MovesetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, MovesetModel? moveset});
}

/// @nodoc
class __$$MovesetStateImplCopyWithImpl<$Res>
    extends _$MovesetStateCopyWithImpl<$Res, _$MovesetStateImpl>
    implements _$$MovesetStateImplCopyWith<$Res> {
  __$$MovesetStateImplCopyWithImpl(
      _$MovesetStateImpl _value, $Res Function(_$MovesetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovesetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? moveset = freezed,
  }) {
    return _then(_$MovesetStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      moveset: freezed == moveset
          ? _value.moveset
          : moveset // ignore: cast_nullable_to_non_nullable
              as MovesetModel?,
    ));
  }
}

/// @nodoc

class _$MovesetStateImpl implements _MovesetState {
  const _$MovesetStateImpl({required this.status, this.moveset});

  @override
  final Status status;
  @override
  final MovesetModel? moveset;

  @override
  String toString() {
    return 'MovesetState(status: $status, moveset: $moveset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovesetStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.moveset, moveset) || other.moveset == moveset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, moveset);

  /// Create a copy of MovesetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovesetStateImplCopyWith<_$MovesetStateImpl> get copyWith =>
      __$$MovesetStateImplCopyWithImpl<_$MovesetStateImpl>(this, _$identity);
}

abstract class _MovesetState implements MovesetState {
  const factory _MovesetState(
      {required final Status status,
      final MovesetModel? moveset}) = _$MovesetStateImpl;

  @override
  Status get status;
  @override
  MovesetModel? get moveset;

  /// Create a copy of MovesetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovesetStateImplCopyWith<_$MovesetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
