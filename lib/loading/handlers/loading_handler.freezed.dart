// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_handler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadingHandler {
  String get idLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idLoading) fullscreen,
    required TResult Function(String idLoading) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idLoading)? fullscreen,
    TResult? Function(String idLoading)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idLoading)? fullscreen,
    TResult Function(String idLoading)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullScreen value) fullscreen,
    required TResult Function(_Custom value) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullScreen value)? fullscreen,
    TResult? Function(_Custom value)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullScreen value)? fullscreen,
    TResult Function(_Custom value)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadingHandlerCopyWith<LoadingHandler> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingHandlerCopyWith<$Res> {
  factory $LoadingHandlerCopyWith(
          LoadingHandler value, $Res Function(LoadingHandler) then) =
      _$LoadingHandlerCopyWithImpl<$Res, LoadingHandler>;
  @useResult
  $Res call({String idLoading});
}

/// @nodoc
class _$LoadingHandlerCopyWithImpl<$Res, $Val extends LoadingHandler>
    implements $LoadingHandlerCopyWith<$Res> {
  _$LoadingHandlerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLoading = null,
  }) {
    return _then(_value.copyWith(
      idLoading: null == idLoading
          ? _value.idLoading
          : idLoading // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FullScreenImplCopyWith<$Res>
    implements $LoadingHandlerCopyWith<$Res> {
  factory _$$FullScreenImplCopyWith(
          _$FullScreenImpl value, $Res Function(_$FullScreenImpl) then) =
      __$$FullScreenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idLoading});
}

/// @nodoc
class __$$FullScreenImplCopyWithImpl<$Res>
    extends _$LoadingHandlerCopyWithImpl<$Res, _$FullScreenImpl>
    implements _$$FullScreenImplCopyWith<$Res> {
  __$$FullScreenImplCopyWithImpl(
      _$FullScreenImpl _value, $Res Function(_$FullScreenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLoading = null,
  }) {
    return _then(_$FullScreenImpl(
      idLoading: null == idLoading
          ? _value.idLoading
          : idLoading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FullScreenImpl implements _FullScreen {
  _$FullScreenImpl({required this.idLoading});

  @override
  final String idLoading;

  @override
  String toString() {
    return 'LoadingHandler.fullscreen(idLoading: $idLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullScreenImpl &&
            (identical(other.idLoading, idLoading) ||
                other.idLoading == idLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullScreenImplCopyWith<_$FullScreenImpl> get copyWith =>
      __$$FullScreenImplCopyWithImpl<_$FullScreenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idLoading) fullscreen,
    required TResult Function(String idLoading) custom,
  }) {
    return fullscreen(idLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idLoading)? fullscreen,
    TResult? Function(String idLoading)? custom,
  }) {
    return fullscreen?.call(idLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idLoading)? fullscreen,
    TResult Function(String idLoading)? custom,
    required TResult orElse(),
  }) {
    if (fullscreen != null) {
      return fullscreen(idLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullScreen value) fullscreen,
    required TResult Function(_Custom value) custom,
  }) {
    return fullscreen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullScreen value)? fullscreen,
    TResult? Function(_Custom value)? custom,
  }) {
    return fullscreen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullScreen value)? fullscreen,
    TResult Function(_Custom value)? custom,
    required TResult orElse(),
  }) {
    if (fullscreen != null) {
      return fullscreen(this);
    }
    return orElse();
  }
}

abstract class _FullScreen implements LoadingHandler {
  factory _FullScreen({required final String idLoading}) = _$FullScreenImpl;

  @override
  String get idLoading;
  @override
  @JsonKey(ignore: true)
  _$$FullScreenImplCopyWith<_$FullScreenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomImplCopyWith<$Res>
    implements $LoadingHandlerCopyWith<$Res> {
  factory _$$CustomImplCopyWith(
          _$CustomImpl value, $Res Function(_$CustomImpl) then) =
      __$$CustomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idLoading});
}

/// @nodoc
class __$$CustomImplCopyWithImpl<$Res>
    extends _$LoadingHandlerCopyWithImpl<$Res, _$CustomImpl>
    implements _$$CustomImplCopyWith<$Res> {
  __$$CustomImplCopyWithImpl(
      _$CustomImpl _value, $Res Function(_$CustomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLoading = null,
  }) {
    return _then(_$CustomImpl(
      idLoading: null == idLoading
          ? _value.idLoading
          : idLoading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomImpl implements _Custom {
  _$CustomImpl({required this.idLoading});

  @override
  final String idLoading;

  @override
  String toString() {
    return 'LoadingHandler.custom(idLoading: $idLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomImpl &&
            (identical(other.idLoading, idLoading) ||
                other.idLoading == idLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomImplCopyWith<_$CustomImpl> get copyWith =>
      __$$CustomImplCopyWithImpl<_$CustomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idLoading) fullscreen,
    required TResult Function(String idLoading) custom,
  }) {
    return custom(idLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idLoading)? fullscreen,
    TResult? Function(String idLoading)? custom,
  }) {
    return custom?.call(idLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idLoading)? fullscreen,
    TResult Function(String idLoading)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(idLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullScreen value) fullscreen,
    required TResult Function(_Custom value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullScreen value)? fullscreen,
    TResult? Function(_Custom value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullScreen value)? fullscreen,
    TResult Function(_Custom value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class _Custom implements LoadingHandler {
  factory _Custom({required final String idLoading}) = _$CustomImpl;

  @override
  String get idLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomImplCopyWith<_$CustomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
