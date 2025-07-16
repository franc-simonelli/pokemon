// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_tab_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameTabState {
  List<String> get games => throw _privateConstructorUsedError;
  Status get gamesStatus => throw _privateConstructorUsedError;
  String get gameSelected => throw _privateConstructorUsedError;

  /// Create a copy of GameTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameTabStateCopyWith<GameTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameTabStateCopyWith<$Res> {
  factory $GameTabStateCopyWith(
          GameTabState value, $Res Function(GameTabState) then) =
      _$GameTabStateCopyWithImpl<$Res, GameTabState>;
  @useResult
  $Res call({List<String> games, Status gamesStatus, String gameSelected});
}

/// @nodoc
class _$GameTabStateCopyWithImpl<$Res, $Val extends GameTabState>
    implements $GameTabStateCopyWith<$Res> {
  _$GameTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? games = null,
    Object? gamesStatus = null,
    Object? gameSelected = null,
  }) {
    return _then(_value.copyWith(
      games: null == games
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gamesStatus: null == gamesStatus
          ? _value.gamesStatus
          : gamesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      gameSelected: null == gameSelected
          ? _value.gameSelected
          : gameSelected // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameTabStateImplCopyWith<$Res>
    implements $GameTabStateCopyWith<$Res> {
  factory _$$GameTabStateImplCopyWith(
          _$GameTabStateImpl value, $Res Function(_$GameTabStateImpl) then) =
      __$$GameTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> games, Status gamesStatus, String gameSelected});
}

/// @nodoc
class __$$GameTabStateImplCopyWithImpl<$Res>
    extends _$GameTabStateCopyWithImpl<$Res, _$GameTabStateImpl>
    implements _$$GameTabStateImplCopyWith<$Res> {
  __$$GameTabStateImplCopyWithImpl(
      _$GameTabStateImpl _value, $Res Function(_$GameTabStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? games = null,
    Object? gamesStatus = null,
    Object? gameSelected = null,
  }) {
    return _then(_$GameTabStateImpl(
      games: null == games
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gamesStatus: null == gamesStatus
          ? _value.gamesStatus
          : gamesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      gameSelected: null == gameSelected
          ? _value.gameSelected
          : gameSelected // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GameTabStateImpl implements _GameTabState {
  const _$GameTabStateImpl(
      {required final List<String> games,
      required this.gamesStatus,
      required this.gameSelected})
      : _games = games;

  final List<String> _games;
  @override
  List<String> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  @override
  final Status gamesStatus;
  @override
  final String gameSelected;

  @override
  String toString() {
    return 'GameTabState(games: $games, gamesStatus: $gamesStatus, gameSelected: $gameSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameTabStateImpl &&
            const DeepCollectionEquality().equals(other._games, _games) &&
            (identical(other.gamesStatus, gamesStatus) ||
                other.gamesStatus == gamesStatus) &&
            (identical(other.gameSelected, gameSelected) ||
                other.gameSelected == gameSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_games), gamesStatus, gameSelected);

  /// Create a copy of GameTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameTabStateImplCopyWith<_$GameTabStateImpl> get copyWith =>
      __$$GameTabStateImplCopyWithImpl<_$GameTabStateImpl>(this, _$identity);
}

abstract class _GameTabState implements GameTabState {
  const factory _GameTabState(
      {required final List<String> games,
      required final Status gamesStatus,
      required final String gameSelected}) = _$GameTabStateImpl;

  @override
  List<String> get games;
  @override
  Status get gamesStatus;
  @override
  String get gameSelected;

  /// Create a copy of GameTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameTabStateImplCopyWith<_$GameTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
