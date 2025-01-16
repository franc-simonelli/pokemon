// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_pokemon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchPokemonState {
  List<PokemonModel> get chronology => throw _privateConstructorUsedError;
  List<PokemonModel> get pokemons => throw _privateConstructorUsedError;
  Status get pokemonsStatus => throw _privateConstructorUsedError;
  Status get chronologyStatus => throw _privateConstructorUsedError;
  String? get filterText => throw _privateConstructorUsedError;

  /// Create a copy of SearchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchPokemonStateCopyWith<SearchPokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPokemonStateCopyWith<$Res> {
  factory $SearchPokemonStateCopyWith(
          SearchPokemonState value, $Res Function(SearchPokemonState) then) =
      _$SearchPokemonStateCopyWithImpl<$Res, SearchPokemonState>;
  @useResult
  $Res call(
      {List<PokemonModel> chronology,
      List<PokemonModel> pokemons,
      Status pokemonsStatus,
      Status chronologyStatus,
      String? filterText});
}

/// @nodoc
class _$SearchPokemonStateCopyWithImpl<$Res, $Val extends SearchPokemonState>
    implements $SearchPokemonStateCopyWith<$Res> {
  _$SearchPokemonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chronology = null,
    Object? pokemons = null,
    Object? pokemonsStatus = null,
    Object? chronologyStatus = null,
    Object? filterText = freezed,
  }) {
    return _then(_value.copyWith(
      chronology: null == chronology
          ? _value.chronology
          : chronology // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      pokemonsStatus: null == pokemonsStatus
          ? _value.pokemonsStatus
          : pokemonsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      chronologyStatus: null == chronologyStatus
          ? _value.chronologyStatus
          : chronologyStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      filterText: freezed == filterText
          ? _value.filterText
          : filterText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPokemonStateImplCopyWith<$Res>
    implements $SearchPokemonStateCopyWith<$Res> {
  factory _$$SearchPokemonStateImplCopyWith(_$SearchPokemonStateImpl value,
          $Res Function(_$SearchPokemonStateImpl) then) =
      __$$SearchPokemonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PokemonModel> chronology,
      List<PokemonModel> pokemons,
      Status pokemonsStatus,
      Status chronologyStatus,
      String? filterText});
}

/// @nodoc
class __$$SearchPokemonStateImplCopyWithImpl<$Res>
    extends _$SearchPokemonStateCopyWithImpl<$Res, _$SearchPokemonStateImpl>
    implements _$$SearchPokemonStateImplCopyWith<$Res> {
  __$$SearchPokemonStateImplCopyWithImpl(_$SearchPokemonStateImpl _value,
      $Res Function(_$SearchPokemonStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chronology = null,
    Object? pokemons = null,
    Object? pokemonsStatus = null,
    Object? chronologyStatus = null,
    Object? filterText = freezed,
  }) {
    return _then(_$SearchPokemonStateImpl(
      chronology: null == chronology
          ? _value._chronology
          : chronology // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      pokemons: null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      pokemonsStatus: null == pokemonsStatus
          ? _value.pokemonsStatus
          : pokemonsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      chronologyStatus: null == chronologyStatus
          ? _value.chronologyStatus
          : chronologyStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      filterText: freezed == filterText
          ? _value.filterText
          : filterText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchPokemonStateImpl implements _SearchPokemonState {
  const _$SearchPokemonStateImpl(
      {required final List<PokemonModel> chronology,
      required final List<PokemonModel> pokemons,
      required this.pokemonsStatus,
      required this.chronologyStatus,
      this.filterText})
      : _chronology = chronology,
        _pokemons = pokemons;

  final List<PokemonModel> _chronology;
  @override
  List<PokemonModel> get chronology {
    if (_chronology is EqualUnmodifiableListView) return _chronology;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chronology);
  }

  final List<PokemonModel> _pokemons;
  @override
  List<PokemonModel> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final Status pokemonsStatus;
  @override
  final Status chronologyStatus;
  @override
  final String? filterText;

  @override
  String toString() {
    return 'SearchPokemonState(chronology: $chronology, pokemons: $pokemons, pokemonsStatus: $pokemonsStatus, chronologyStatus: $chronologyStatus, filterText: $filterText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPokemonStateImpl &&
            const DeepCollectionEquality()
                .equals(other._chronology, _chronology) &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.pokemonsStatus, pokemonsStatus) ||
                other.pokemonsStatus == pokemonsStatus) &&
            (identical(other.chronologyStatus, chronologyStatus) ||
                other.chronologyStatus == chronologyStatus) &&
            (identical(other.filterText, filterText) ||
                other.filterText == filterText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chronology),
      const DeepCollectionEquality().hash(_pokemons),
      pokemonsStatus,
      chronologyStatus,
      filterText);

  /// Create a copy of SearchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPokemonStateImplCopyWith<_$SearchPokemonStateImpl> get copyWith =>
      __$$SearchPokemonStateImplCopyWithImpl<_$SearchPokemonStateImpl>(
          this, _$identity);
}

abstract class _SearchPokemonState implements SearchPokemonState {
  const factory _SearchPokemonState(
      {required final List<PokemonModel> chronology,
      required final List<PokemonModel> pokemons,
      required final Status pokemonsStatus,
      required final Status chronologyStatus,
      final String? filterText}) = _$SearchPokemonStateImpl;

  @override
  List<PokemonModel> get chronology;
  @override
  List<PokemonModel> get pokemons;
  @override
  Status get pokemonsStatus;
  @override
  Status get chronologyStatus;
  @override
  String? get filterText;

  /// Create a copy of SearchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchPokemonStateImplCopyWith<_$SearchPokemonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
