// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_moves_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TableMovesState {
  List<MoveModel> get moves => throw _privateConstructorUsedError;
  Status get movesStatus => throw _privateConstructorUsedError;
  PokemonModel? get pokemon => throw _privateConstructorUsedError;
  List<MoveModel> get moveLevelUp => throw _privateConstructorUsedError;
  List<MoveModel> get moveMachine => throw _privateConstructorUsedError;

  /// Create a copy of TableMovesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableMovesStateCopyWith<TableMovesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableMovesStateCopyWith<$Res> {
  factory $TableMovesStateCopyWith(
          TableMovesState value, $Res Function(TableMovesState) then) =
      _$TableMovesStateCopyWithImpl<$Res, TableMovesState>;
  @useResult
  $Res call(
      {List<MoveModel> moves,
      Status movesStatus,
      PokemonModel? pokemon,
      List<MoveModel> moveLevelUp,
      List<MoveModel> moveMachine});
}

/// @nodoc
class _$TableMovesStateCopyWithImpl<$Res, $Val extends TableMovesState>
    implements $TableMovesStateCopyWith<$Res> {
  _$TableMovesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableMovesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moves = null,
    Object? movesStatus = null,
    Object? pokemon = freezed,
    Object? moveLevelUp = null,
    Object? moveMachine = null,
  }) {
    return _then(_value.copyWith(
      moves: null == moves
          ? _value.moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<MoveModel>,
      movesStatus: null == movesStatus
          ? _value.movesStatus
          : movesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
      moveLevelUp: null == moveLevelUp
          ? _value.moveLevelUp
          : moveLevelUp // ignore: cast_nullable_to_non_nullable
              as List<MoveModel>,
      moveMachine: null == moveMachine
          ? _value.moveMachine
          : moveMachine // ignore: cast_nullable_to_non_nullable
              as List<MoveModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableMovesStateImplCopyWith<$Res>
    implements $TableMovesStateCopyWith<$Res> {
  factory _$$TableMovesStateImplCopyWith(_$TableMovesStateImpl value,
          $Res Function(_$TableMovesStateImpl) then) =
      __$$TableMovesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MoveModel> moves,
      Status movesStatus,
      PokemonModel? pokemon,
      List<MoveModel> moveLevelUp,
      List<MoveModel> moveMachine});
}

/// @nodoc
class __$$TableMovesStateImplCopyWithImpl<$Res>
    extends _$TableMovesStateCopyWithImpl<$Res, _$TableMovesStateImpl>
    implements _$$TableMovesStateImplCopyWith<$Res> {
  __$$TableMovesStateImplCopyWithImpl(
      _$TableMovesStateImpl _value, $Res Function(_$TableMovesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableMovesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moves = null,
    Object? movesStatus = null,
    Object? pokemon = freezed,
    Object? moveLevelUp = null,
    Object? moveMachine = null,
  }) {
    return _then(_$TableMovesStateImpl(
      moves: null == moves
          ? _value._moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<MoveModel>,
      movesStatus: null == movesStatus
          ? _value.movesStatus
          : movesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
      moveLevelUp: null == moveLevelUp
          ? _value._moveLevelUp
          : moveLevelUp // ignore: cast_nullable_to_non_nullable
              as List<MoveModel>,
      moveMachine: null == moveMachine
          ? _value._moveMachine
          : moveMachine // ignore: cast_nullable_to_non_nullable
              as List<MoveModel>,
    ));
  }
}

/// @nodoc

class _$TableMovesStateImpl implements _TableMovesState {
  const _$TableMovesStateImpl(
      {required final List<MoveModel> moves,
      required this.movesStatus,
      this.pokemon,
      required final List<MoveModel> moveLevelUp,
      required final List<MoveModel> moveMachine})
      : _moves = moves,
        _moveLevelUp = moveLevelUp,
        _moveMachine = moveMachine;

  final List<MoveModel> _moves;
  @override
  List<MoveModel> get moves {
    if (_moves is EqualUnmodifiableListView) return _moves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moves);
  }

  @override
  final Status movesStatus;
  @override
  final PokemonModel? pokemon;
  final List<MoveModel> _moveLevelUp;
  @override
  List<MoveModel> get moveLevelUp {
    if (_moveLevelUp is EqualUnmodifiableListView) return _moveLevelUp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moveLevelUp);
  }

  final List<MoveModel> _moveMachine;
  @override
  List<MoveModel> get moveMachine {
    if (_moveMachine is EqualUnmodifiableListView) return _moveMachine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moveMachine);
  }

  @override
  String toString() {
    return 'TableMovesState(moves: $moves, movesStatus: $movesStatus, pokemon: $pokemon, moveLevelUp: $moveLevelUp, moveMachine: $moveMachine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableMovesStateImpl &&
            const DeepCollectionEquality().equals(other._moves, _moves) &&
            (identical(other.movesStatus, movesStatus) ||
                other.movesStatus == movesStatus) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            const DeepCollectionEquality()
                .equals(other._moveLevelUp, _moveLevelUp) &&
            const DeepCollectionEquality()
                .equals(other._moveMachine, _moveMachine));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_moves),
      movesStatus,
      pokemon,
      const DeepCollectionEquality().hash(_moveLevelUp),
      const DeepCollectionEquality().hash(_moveMachine));

  /// Create a copy of TableMovesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableMovesStateImplCopyWith<_$TableMovesStateImpl> get copyWith =>
      __$$TableMovesStateImplCopyWithImpl<_$TableMovesStateImpl>(
          this, _$identity);
}

abstract class _TableMovesState implements TableMovesState {
  const factory _TableMovesState(
      {required final List<MoveModel> moves,
      required final Status movesStatus,
      final PokemonModel? pokemon,
      required final List<MoveModel> moveLevelUp,
      required final List<MoveModel> moveMachine}) = _$TableMovesStateImpl;

  @override
  List<MoveModel> get moves;
  @override
  Status get movesStatus;
  @override
  PokemonModel? get pokemon;
  @override
  List<MoveModel> get moveLevelUp;
  @override
  List<MoveModel> get moveMachine;

  /// Create a copy of TableMovesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableMovesStateImplCopyWith<_$TableMovesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
