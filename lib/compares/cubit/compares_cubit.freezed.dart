// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compares_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComparesState {
  List<PokemonModel> get pokemons => throw _privateConstructorUsedError;
  PokemonModel? get firstPokemonSelected => throw _privateConstructorUsedError;
  PokemonModel? get secondPokemonSelected => throw _privateConstructorUsedError;

  /// Create a copy of ComparesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComparesStateCopyWith<ComparesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparesStateCopyWith<$Res> {
  factory $ComparesStateCopyWith(
          ComparesState value, $Res Function(ComparesState) then) =
      _$ComparesStateCopyWithImpl<$Res, ComparesState>;
  @useResult
  $Res call(
      {List<PokemonModel> pokemons,
      PokemonModel? firstPokemonSelected,
      PokemonModel? secondPokemonSelected});
}

/// @nodoc
class _$ComparesStateCopyWithImpl<$Res, $Val extends ComparesState>
    implements $ComparesStateCopyWith<$Res> {
  _$ComparesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComparesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? firstPokemonSelected = freezed,
    Object? secondPokemonSelected = freezed,
  }) {
    return _then(_value.copyWith(
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      firstPokemonSelected: freezed == firstPokemonSelected
          ? _value.firstPokemonSelected
          : firstPokemonSelected // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
      secondPokemonSelected: freezed == secondPokemonSelected
          ? _value.secondPokemonSelected
          : secondPokemonSelected // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComparesStateImplCopyWith<$Res>
    implements $ComparesStateCopyWith<$Res> {
  factory _$$ComparesStateImplCopyWith(
          _$ComparesStateImpl value, $Res Function(_$ComparesStateImpl) then) =
      __$$ComparesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PokemonModel> pokemons,
      PokemonModel? firstPokemonSelected,
      PokemonModel? secondPokemonSelected});
}

/// @nodoc
class __$$ComparesStateImplCopyWithImpl<$Res>
    extends _$ComparesStateCopyWithImpl<$Res, _$ComparesStateImpl>
    implements _$$ComparesStateImplCopyWith<$Res> {
  __$$ComparesStateImplCopyWithImpl(
      _$ComparesStateImpl _value, $Res Function(_$ComparesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComparesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? firstPokemonSelected = freezed,
    Object? secondPokemonSelected = freezed,
  }) {
    return _then(_$ComparesStateImpl(
      pokemons: null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      firstPokemonSelected: freezed == firstPokemonSelected
          ? _value.firstPokemonSelected
          : firstPokemonSelected // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
      secondPokemonSelected: freezed == secondPokemonSelected
          ? _value.secondPokemonSelected
          : secondPokemonSelected // ignore: cast_nullable_to_non_nullable
              as PokemonModel?,
    ));
  }
}

/// @nodoc

class _$ComparesStateImpl extends _ComparesState {
  const _$ComparesStateImpl(
      {required final List<PokemonModel> pokemons,
      this.firstPokemonSelected,
      this.secondPokemonSelected})
      : _pokemons = pokemons,
        super._();

  final List<PokemonModel> _pokemons;
  @override
  List<PokemonModel> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final PokemonModel? firstPokemonSelected;
  @override
  final PokemonModel? secondPokemonSelected;

  @override
  String toString() {
    return 'ComparesState(pokemons: $pokemons, firstPokemonSelected: $firstPokemonSelected, secondPokemonSelected: $secondPokemonSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComparesStateImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.firstPokemonSelected, firstPokemonSelected) ||
                other.firstPokemonSelected == firstPokemonSelected) &&
            (identical(other.secondPokemonSelected, secondPokemonSelected) ||
                other.secondPokemonSelected == secondPokemonSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pokemons),
      firstPokemonSelected,
      secondPokemonSelected);

  /// Create a copy of ComparesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComparesStateImplCopyWith<_$ComparesStateImpl> get copyWith =>
      __$$ComparesStateImplCopyWithImpl<_$ComparesStateImpl>(this, _$identity);
}

abstract class _ComparesState extends ComparesState {
  const factory _ComparesState(
      {required final List<PokemonModel> pokemons,
      final PokemonModel? firstPokemonSelected,
      final PokemonModel? secondPokemonSelected}) = _$ComparesStateImpl;
  const _ComparesState._() : super._();

  @override
  List<PokemonModel> get pokemons;
  @override
  PokemonModel? get firstPokemonSelected;
  @override
  PokemonModel? get secondPokemonSelected;

  /// Create a copy of ComparesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComparesStateImplCopyWith<_$ComparesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
