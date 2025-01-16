// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonDetailState {
  PokemonModel get pokemonSelected => throw _privateConstructorUsedError;
  EnumGen get gen => throw _privateConstructorUsedError;
  Status get pokemonStatus => throw _privateConstructorUsedError;
  List<PokemonModel> get pokemonList => throw _privateConstructorUsedError;
  int? get initialIndex => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailStateCopyWith<PokemonDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailStateCopyWith<$Res> {
  factory $PokemonDetailStateCopyWith(
          PokemonDetailState value, $Res Function(PokemonDetailState) then) =
      _$PokemonDetailStateCopyWithImpl<$Res, PokemonDetailState>;
  @useResult
  $Res call(
      {PokemonModel pokemonSelected,
      EnumGen gen,
      Status pokemonStatus,
      List<PokemonModel> pokemonList,
      int? initialIndex});
}

/// @nodoc
class _$PokemonDetailStateCopyWithImpl<$Res, $Val extends PokemonDetailState>
    implements $PokemonDetailStateCopyWith<$Res> {
  _$PokemonDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonSelected = null,
    Object? gen = null,
    Object? pokemonStatus = null,
    Object? pokemonList = null,
    Object? initialIndex = freezed,
  }) {
    return _then(_value.copyWith(
      pokemonSelected: null == pokemonSelected
          ? _value.pokemonSelected
          : pokemonSelected // ignore: cast_nullable_to_non_nullable
              as PokemonModel,
      gen: null == gen
          ? _value.gen
          : gen // ignore: cast_nullable_to_non_nullable
              as EnumGen,
      pokemonStatus: null == pokemonStatus
          ? _value.pokemonStatus
          : pokemonStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      pokemonList: null == pokemonList
          ? _value.pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      initialIndex: freezed == initialIndex
          ? _value.initialIndex
          : initialIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonDetailStateImplCopyWith<$Res>
    implements $PokemonDetailStateCopyWith<$Res> {
  factory _$$PokemonDetailStateImplCopyWith(_$PokemonDetailStateImpl value,
          $Res Function(_$PokemonDetailStateImpl) then) =
      __$$PokemonDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PokemonModel pokemonSelected,
      EnumGen gen,
      Status pokemonStatus,
      List<PokemonModel> pokemonList,
      int? initialIndex});
}

/// @nodoc
class __$$PokemonDetailStateImplCopyWithImpl<$Res>
    extends _$PokemonDetailStateCopyWithImpl<$Res, _$PokemonDetailStateImpl>
    implements _$$PokemonDetailStateImplCopyWith<$Res> {
  __$$PokemonDetailStateImplCopyWithImpl(_$PokemonDetailStateImpl _value,
      $Res Function(_$PokemonDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonSelected = null,
    Object? gen = null,
    Object? pokemonStatus = null,
    Object? pokemonList = null,
    Object? initialIndex = freezed,
  }) {
    return _then(_$PokemonDetailStateImpl(
      pokemonSelected: null == pokemonSelected
          ? _value.pokemonSelected
          : pokemonSelected // ignore: cast_nullable_to_non_nullable
              as PokemonModel,
      gen: null == gen
          ? _value.gen
          : gen // ignore: cast_nullable_to_non_nullable
              as EnumGen,
      pokemonStatus: null == pokemonStatus
          ? _value.pokemonStatus
          : pokemonStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      pokemonList: null == pokemonList
          ? _value._pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      initialIndex: freezed == initialIndex
          ? _value.initialIndex
          : initialIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PokemonDetailStateImpl extends _PokemonDetailState {
  const _$PokemonDetailStateImpl(
      {required this.pokemonSelected,
      required this.gen,
      required this.pokemonStatus,
      required final List<PokemonModel> pokemonList,
      this.initialIndex})
      : _pokemonList = pokemonList,
        super._();

  @override
  final PokemonModel pokemonSelected;
  @override
  final EnumGen gen;
  @override
  final Status pokemonStatus;
  final List<PokemonModel> _pokemonList;
  @override
  List<PokemonModel> get pokemonList {
    if (_pokemonList is EqualUnmodifiableListView) return _pokemonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemonList);
  }

  @override
  final int? initialIndex;

  @override
  String toString() {
    return 'PokemonDetailState(pokemonSelected: $pokemonSelected, gen: $gen, pokemonStatus: $pokemonStatus, pokemonList: $pokemonList, initialIndex: $initialIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailStateImpl &&
            (identical(other.pokemonSelected, pokemonSelected) ||
                other.pokemonSelected == pokemonSelected) &&
            (identical(other.gen, gen) || other.gen == gen) &&
            (identical(other.pokemonStatus, pokemonStatus) ||
                other.pokemonStatus == pokemonStatus) &&
            const DeepCollectionEquality()
                .equals(other._pokemonList, _pokemonList) &&
            (identical(other.initialIndex, initialIndex) ||
                other.initialIndex == initialIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pokemonSelected,
      gen,
      pokemonStatus,
      const DeepCollectionEquality().hash(_pokemonList),
      initialIndex);

  /// Create a copy of PokemonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailStateImplCopyWith<_$PokemonDetailStateImpl> get copyWith =>
      __$$PokemonDetailStateImplCopyWithImpl<_$PokemonDetailStateImpl>(
          this, _$identity);
}

abstract class _PokemonDetailState extends PokemonDetailState {
  const factory _PokemonDetailState(
      {required final PokemonModel pokemonSelected,
      required final EnumGen gen,
      required final Status pokemonStatus,
      required final List<PokemonModel> pokemonList,
      final int? initialIndex}) = _$PokemonDetailStateImpl;
  const _PokemonDetailState._() : super._();

  @override
  PokemonModel get pokemonSelected;
  @override
  EnumGen get gen;
  @override
  Status get pokemonStatus;
  @override
  List<PokemonModel> get pokemonList;
  @override
  int? get initialIndex;

  /// Create a copy of PokemonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailStateImplCopyWith<_$PokemonDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
