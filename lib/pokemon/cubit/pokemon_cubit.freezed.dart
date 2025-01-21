// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonState {
  Status get statusPagination => throw _privateConstructorUsedError;
  List<PokemonModel> get listPokemons => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  EnumGen get gen => throw _privateConstructorUsedError;
  bool? get isLastPage => throw _privateConstructorUsedError;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStateCopyWith<PokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStateCopyWith<$Res> {
  factory $PokemonStateCopyWith(
          PokemonState value, $Res Function(PokemonState) then) =
      _$PokemonStateCopyWithImpl<$Res, PokemonState>;
  @useResult
  $Res call(
      {Status statusPagination,
      List<PokemonModel> listPokemons,
      int currentPage,
      EnumGen gen,
      bool? isLastPage});
}

/// @nodoc
class _$PokemonStateCopyWithImpl<$Res, $Val extends PokemonState>
    implements $PokemonStateCopyWith<$Res> {
  _$PokemonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusPagination = null,
    Object? listPokemons = null,
    Object? currentPage = null,
    Object? gen = null,
    Object? isLastPage = freezed,
  }) {
    return _then(_value.copyWith(
      statusPagination: null == statusPagination
          ? _value.statusPagination
          : statusPagination // ignore: cast_nullable_to_non_nullable
              as Status,
      listPokemons: null == listPokemons
          ? _value.listPokemons
          : listPokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      gen: null == gen
          ? _value.gen
          : gen // ignore: cast_nullable_to_non_nullable
              as EnumGen,
      isLastPage: freezed == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonStateImplCopyWith<$Res>
    implements $PokemonStateCopyWith<$Res> {
  factory _$$PokemonStateImplCopyWith(
          _$PokemonStateImpl value, $Res Function(_$PokemonStateImpl) then) =
      __$$PokemonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status statusPagination,
      List<PokemonModel> listPokemons,
      int currentPage,
      EnumGen gen,
      bool? isLastPage});
}

/// @nodoc
class __$$PokemonStateImplCopyWithImpl<$Res>
    extends _$PokemonStateCopyWithImpl<$Res, _$PokemonStateImpl>
    implements _$$PokemonStateImplCopyWith<$Res> {
  __$$PokemonStateImplCopyWithImpl(
      _$PokemonStateImpl _value, $Res Function(_$PokemonStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusPagination = null,
    Object? listPokemons = null,
    Object? currentPage = null,
    Object? gen = null,
    Object? isLastPage = freezed,
  }) {
    return _then(_$PokemonStateImpl(
      statusPagination: null == statusPagination
          ? _value.statusPagination
          : statusPagination // ignore: cast_nullable_to_non_nullable
              as Status,
      listPokemons: null == listPokemons
          ? _value._listPokemons
          : listPokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      gen: null == gen
          ? _value.gen
          : gen // ignore: cast_nullable_to_non_nullable
              as EnumGen,
      isLastPage: freezed == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$PokemonStateImpl implements _PokemonState {
  const _$PokemonStateImpl(
      {required this.statusPagination,
      required final List<PokemonModel> listPokemons,
      required this.currentPage,
      required this.gen,
      this.isLastPage})
      : _listPokemons = listPokemons;

  @override
  final Status statusPagination;
  final List<PokemonModel> _listPokemons;
  @override
  List<PokemonModel> get listPokemons {
    if (_listPokemons is EqualUnmodifiableListView) return _listPokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listPokemons);
  }

  @override
  final int currentPage;
  @override
  final EnumGen gen;
  @override
  final bool? isLastPage;

  @override
  String toString() {
    return 'PokemonState(statusPagination: $statusPagination, listPokemons: $listPokemons, currentPage: $currentPage, gen: $gen, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStateImpl &&
            (identical(other.statusPagination, statusPagination) ||
                other.statusPagination == statusPagination) &&
            const DeepCollectionEquality()
                .equals(other._listPokemons, _listPokemons) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.gen, gen) || other.gen == gen) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusPagination,
      const DeepCollectionEquality().hash(_listPokemons),
      currentPage,
      gen,
      isLastPage);

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStateImplCopyWith<_$PokemonStateImpl> get copyWith =>
      __$$PokemonStateImplCopyWithImpl<_$PokemonStateImpl>(this, _$identity);
}

abstract class _PokemonState implements PokemonState {
  const factory _PokemonState(
      {required final Status statusPagination,
      required final List<PokemonModel> listPokemons,
      required final int currentPage,
      required final EnumGen gen,
      final bool? isLastPage}) = _$PokemonStateImpl;

  @override
  Status get statusPagination;
  @override
  List<PokemonModel> get listPokemons;
  @override
  int get currentPage;
  @override
  EnumGen get gen;
  @override
  bool? get isLastPage;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStateImplCopyWith<_$PokemonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
