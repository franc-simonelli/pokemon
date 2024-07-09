// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TypeState {
  List<String> get allTypes => throw _privateConstructorUsedError;
  List<String> get typesSelect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TypeStateCopyWith<TypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeStateCopyWith<$Res> {
  factory $TypeStateCopyWith(TypeState value, $Res Function(TypeState) then) =
      _$TypeStateCopyWithImpl<$Res, TypeState>;
  @useResult
  $Res call({List<String> allTypes, List<String> typesSelect});
}

/// @nodoc
class _$TypeStateCopyWithImpl<$Res, $Val extends TypeState>
    implements $TypeStateCopyWith<$Res> {
  _$TypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTypes = null,
    Object? typesSelect = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeStateImplCopyWith<$Res>
    implements $TypeStateCopyWith<$Res> {
  factory _$$TypeStateImplCopyWith(
          _$TypeStateImpl value, $Res Function(_$TypeStateImpl) then) =
      __$$TypeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> allTypes, List<String> typesSelect});
}

/// @nodoc
class __$$TypeStateImplCopyWithImpl<$Res>
    extends _$TypeStateCopyWithImpl<$Res, _$TypeStateImpl>
    implements _$$TypeStateImplCopyWith<$Res> {
  __$$TypeStateImplCopyWithImpl(
      _$TypeStateImpl _value, $Res Function(_$TypeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTypes = null,
    Object? typesSelect = null,
  }) {
    return _then(_$TypeStateImpl(
      allTypes: null == allTypes
          ? _value._allTypes
          : allTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typesSelect: null == typesSelect
          ? _value._typesSelect
          : typesSelect // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$TypeStateImpl implements _TypeState {
  const _$TypeStateImpl(
      {required final List<String> allTypes,
      required final List<String> typesSelect})
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
  String toString() {
    return 'TypeState(allTypes: $allTypes, typesSelect: $typesSelect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeStateImpl &&
            const DeepCollectionEquality().equals(other._allTypes, _allTypes) &&
            const DeepCollectionEquality()
                .equals(other._typesSelect, _typesSelect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTypes),
      const DeepCollectionEquality().hash(_typesSelect));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeStateImplCopyWith<_$TypeStateImpl> get copyWith =>
      __$$TypeStateImplCopyWithImpl<_$TypeStateImpl>(this, _$identity);
}

abstract class _TypeState implements TypeState {
  const factory _TypeState(
      {required final List<String> allTypes,
      required final List<String> typesSelect}) = _$TypeStateImpl;

  @override
  List<String> get allTypes;
  @override
  List<String> get typesSelect;
  @override
  @JsonKey(ignore: true)
  _$$TypeStateImplCopyWith<_$TypeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
