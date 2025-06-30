// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_pokemon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatsPokemonState {
  PokemonModel? get pokemon => throw _privateConstructorUsedError;
  StatsValueModel? get statsBase => throw _privateConstructorUsedError;
  StatsValueModel? get stats => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  bool get showLvSlider => throw _privateConstructorUsedError;
  Nature get nature => throw _privateConstructorUsedError;

  /// Create a copy of StatsPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsPokemonStateCopyWith<StatsPokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsPokemonStateCopyWith<$Res> {
  factory $StatsPokemonStateCopyWith(
          StatsPokemonState value, $Res Function(StatsPokemonState) then) =
      _$StatsPokemonStateCopyWithImpl<$Res, StatsPokemonState>;
  @useResult
  $Res call(
      {PokemonModel? pokemon,
      StatsValueModel? statsBase,
      StatsValueModel? stats,
      int level,
      bool showLvSlider,
      Nature nature});
}

/// @nodoc
class _$StatsPokemonStateCopyWithImpl<$Res, $Val extends StatsPokemonState>
    implements $StatsPokemonStateCopyWith<$Res> {
  _$StatsPokemonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = freezed,
    Object? statsBase = freezed,
    Object? stats = freezed,
    Object? level = null,
    Object? showLvSlider = null,
    Object? nature = null,
  }) {
    return _then(_value.copyWith(
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
      statsBase: freezed == statsBase
          ? _value.statsBase
          : statsBase // ignore: cast_nullable_to_non_nullable
              as StatsValueModel?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StatsValueModel?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      showLvSlider: null == showLvSlider
          ? _value.showLvSlider
          : showLvSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Nature,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsPokemonStateImplCopyWith<$Res>
    implements $StatsPokemonStateCopyWith<$Res> {
  factory _$$StatsPokemonStateImplCopyWith(_$StatsPokemonStateImpl value,
          $Res Function(_$StatsPokemonStateImpl) then) =
      __$$StatsPokemonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PokemonModel? pokemon,
      StatsValueModel? statsBase,
      StatsValueModel? stats,
      int level,
      bool showLvSlider,
      Nature nature});
}

/// @nodoc
class __$$StatsPokemonStateImplCopyWithImpl<$Res>
    extends _$StatsPokemonStateCopyWithImpl<$Res, _$StatsPokemonStateImpl>
    implements _$$StatsPokemonStateImplCopyWith<$Res> {
  __$$StatsPokemonStateImplCopyWithImpl(_$StatsPokemonStateImpl _value,
      $Res Function(_$StatsPokemonStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = freezed,
    Object? statsBase = freezed,
    Object? stats = freezed,
    Object? level = null,
    Object? showLvSlider = null,
    Object? nature = null,
  }) {
    return _then(_$StatsPokemonStateImpl(
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
      statsBase: freezed == statsBase
          ? _value.statsBase
          : statsBase // ignore: cast_nullable_to_non_nullable
              as StatsValueModel?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StatsValueModel?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      showLvSlider: null == showLvSlider
          ? _value.showLvSlider
          : showLvSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Nature,
    ));
  }
}

/// @nodoc

class _$StatsPokemonStateImpl implements _StatsPokemonState {
  const _$StatsPokemonStateImpl(
      {this.pokemon,
      this.statsBase,
      this.stats,
      required this.level,
      required this.showLvSlider,
      required this.nature});

  @override
  final PokemonModel? pokemon;
  @override
  final StatsValueModel? statsBase;
  @override
  final StatsValueModel? stats;
  @override
  final int level;
  @override
  final bool showLvSlider;
  @override
  final Nature nature;

  @override
  String toString() {
    return 'StatsPokemonState(pokemon: $pokemon, statsBase: $statsBase, stats: $stats, level: $level, showLvSlider: $showLvSlider, nature: $nature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsPokemonStateImpl &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            (identical(other.statsBase, statsBase) ||
                other.statsBase == statsBase) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.showLvSlider, showLvSlider) ||
                other.showLvSlider == showLvSlider) &&
            (identical(other.nature, nature) || other.nature == nature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pokemon, statsBase, stats, level, showLvSlider, nature);

  /// Create a copy of StatsPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsPokemonStateImplCopyWith<_$StatsPokemonStateImpl> get copyWith =>
      __$$StatsPokemonStateImplCopyWithImpl<_$StatsPokemonStateImpl>(
          this, _$identity);
}

abstract class _StatsPokemonState implements StatsPokemonState {
  const factory _StatsPokemonState(
      {final PokemonModel? pokemon,
      final StatsValueModel? statsBase,
      final StatsValueModel? stats,
      required final int level,
      required final bool showLvSlider,
      required final Nature nature}) = _$StatsPokemonStateImpl;

  @override
  PokemonModel? get pokemon;
  @override
  StatsValueModel? get statsBase;
  @override
  StatsValueModel? get stats;
  @override
  int get level;
  @override
  bool get showLvSlider;
  @override
  Nature get nature;

  /// Create a copy of StatsPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsPokemonStateImplCopyWith<_$StatsPokemonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
