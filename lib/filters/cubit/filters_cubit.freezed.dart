// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FiltersState {
  List<String> get allTypes => throw _privateConstructorUsedError;
  List<String> get typesSelect => throw _privateConstructorUsedError;
  String? get textFilter => throw _privateConstructorUsedError;
  String? get paramsFilter => throw _privateConstructorUsedError;

  /// Create a copy of FiltersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FiltersStateCopyWith<FiltersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersStateCopyWith<$Res> {
  factory $FiltersStateCopyWith(
          FiltersState value, $Res Function(FiltersState) then) =
      _$FiltersStateCopyWithImpl<$Res, FiltersState>;
  @useResult
  $Res call(
      {List<String> allTypes,
      List<String> typesSelect,
      String? textFilter,
      String? paramsFilter});
}

/// @nodoc
class _$FiltersStateCopyWithImpl<$Res, $Val extends FiltersState>
    implements $FiltersStateCopyWith<$Res> {
  _$FiltersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FiltersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTypes = null,
    Object? typesSelect = null,
    Object? textFilter = freezed,
    Object? paramsFilter = freezed,
  }) {
    return _then(_value.copyWith(
      allTypes: null == allTypes
          ? _value.allTypes
          : allTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typesSelect: null == typesSelect
          ? _value.typesSelect
          : typesSelect // ignore: cast_nullable_to_non_nullable
              as List<String>,
      textFilter: freezed == textFilter
          ? _value.textFilter
          : textFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      paramsFilter: freezed == paramsFilter
          ? _value.paramsFilter
          : paramsFilter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiltersStateImplCopyWith<$Res>
    implements $FiltersStateCopyWith<$Res> {
  factory _$$FiltersStateImplCopyWith(
          _$FiltersStateImpl value, $Res Function(_$FiltersStateImpl) then) =
      __$$FiltersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> allTypes,
      List<String> typesSelect,
      String? textFilter,
      String? paramsFilter});
}

/// @nodoc
class __$$FiltersStateImplCopyWithImpl<$Res>
    extends _$FiltersStateCopyWithImpl<$Res, _$FiltersStateImpl>
    implements _$$FiltersStateImplCopyWith<$Res> {
  __$$FiltersStateImplCopyWithImpl(
      _$FiltersStateImpl _value, $Res Function(_$FiltersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FiltersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTypes = null,
    Object? typesSelect = null,
    Object? textFilter = freezed,
    Object? paramsFilter = freezed,
  }) {
    return _then(_$FiltersStateImpl(
      allTypes: null == allTypes
          ? _value._allTypes
          : allTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typesSelect: null == typesSelect
          ? _value._typesSelect
          : typesSelect // ignore: cast_nullable_to_non_nullable
              as List<String>,
      textFilter: freezed == textFilter
          ? _value.textFilter
          : textFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      paramsFilter: freezed == paramsFilter
          ? _value.paramsFilter
          : paramsFilter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FiltersStateImpl implements _FiltersState {
  const _$FiltersStateImpl(
      {required final List<String> allTypes,
      required final List<String> typesSelect,
      this.textFilter,
      this.paramsFilter})
      : _allTypes = allTypes,
        _typesSelect = typesSelect;

  final List<String> _allTypes;
  @override
  List<String> get allTypes {
    if (_allTypes is EqualUnmodifiableListView) return _allTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTypes);
  }

  final List<String> _typesSelect;
  @override
  List<String> get typesSelect {
    if (_typesSelect is EqualUnmodifiableListView) return _typesSelect;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typesSelect);
  }

  @override
  final String? textFilter;
  @override
  final String? paramsFilter;

  @override
  String toString() {
    return 'FiltersState(allTypes: $allTypes, typesSelect: $typesSelect, textFilter: $textFilter, paramsFilter: $paramsFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersStateImpl &&
            const DeepCollectionEquality().equals(other._allTypes, _allTypes) &&
            const DeepCollectionEquality()
                .equals(other._typesSelect, _typesSelect) &&
            (identical(other.textFilter, textFilter) ||
                other.textFilter == textFilter) &&
            (identical(other.paramsFilter, paramsFilter) ||
                other.paramsFilter == paramsFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTypes),
      const DeepCollectionEquality().hash(_typesSelect),
      textFilter,
      paramsFilter);

  /// Create a copy of FiltersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FiltersStateImplCopyWith<_$FiltersStateImpl> get copyWith =>
      __$$FiltersStateImplCopyWithImpl<_$FiltersStateImpl>(this, _$identity);
}

abstract class _FiltersState implements FiltersState {
  const factory _FiltersState(
      {required final List<String> allTypes,
      required final List<String> typesSelect,
      final String? textFilter,
      final String? paramsFilter}) = _$FiltersStateImpl;

  @override
  List<String> get allTypes;
  @override
  List<String> get typesSelect;
  @override
  String? get textFilter;
  @override
  String? get paramsFilter;

  /// Create a copy of FiltersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FiltersStateImplCopyWith<_$FiltersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
