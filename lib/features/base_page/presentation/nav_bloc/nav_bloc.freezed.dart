// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavEvent {
  PageIndex get newPageIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PageIndex newPageIndex) changePageIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageIndex newPageIndex)? changePageIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageIndex newPageIndex)? changePageIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePageIndex value) changePageIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangePageIndex value)? changePageIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePageIndex value)? changePageIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavEventCopyWith<NavEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavEventCopyWith<$Res> {
  factory $NavEventCopyWith(NavEvent value, $Res Function(NavEvent) then) =
      _$NavEventCopyWithImpl<$Res, NavEvent>;
  @useResult
  $Res call({PageIndex newPageIndex});
}

/// @nodoc
class _$NavEventCopyWithImpl<$Res, $Val extends NavEvent>
    implements $NavEventCopyWith<$Res> {
  _$NavEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPageIndex = null,
  }) {
    return _then(_value.copyWith(
      newPageIndex: null == newPageIndex
          ? _value.newPageIndex
          : newPageIndex // ignore: cast_nullable_to_non_nullable
              as PageIndex,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePageIndexImplCopyWith<$Res>
    implements $NavEventCopyWith<$Res> {
  factory _$$ChangePageIndexImplCopyWith(_$ChangePageIndexImpl value,
          $Res Function(_$ChangePageIndexImpl) then) =
      __$$ChangePageIndexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageIndex newPageIndex});
}

/// @nodoc
class __$$ChangePageIndexImplCopyWithImpl<$Res>
    extends _$NavEventCopyWithImpl<$Res, _$ChangePageIndexImpl>
    implements _$$ChangePageIndexImplCopyWith<$Res> {
  __$$ChangePageIndexImplCopyWithImpl(
      _$ChangePageIndexImpl _value, $Res Function(_$ChangePageIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPageIndex = null,
  }) {
    return _then(_$ChangePageIndexImpl(
      null == newPageIndex
          ? _value.newPageIndex
          : newPageIndex // ignore: cast_nullable_to_non_nullable
              as PageIndex,
    ));
  }
}

/// @nodoc

class _$ChangePageIndexImpl implements _ChangePageIndex {
  const _$ChangePageIndexImpl(this.newPageIndex);

  @override
  final PageIndex newPageIndex;

  @override
  String toString() {
    return 'NavEvent.changePageIndex(newPageIndex: $newPageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePageIndexImpl &&
            (identical(other.newPageIndex, newPageIndex) ||
                other.newPageIndex == newPageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePageIndexImplCopyWith<_$ChangePageIndexImpl> get copyWith =>
      __$$ChangePageIndexImplCopyWithImpl<_$ChangePageIndexImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PageIndex newPageIndex) changePageIndex,
  }) {
    return changePageIndex(newPageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageIndex newPageIndex)? changePageIndex,
  }) {
    return changePageIndex?.call(newPageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageIndex newPageIndex)? changePageIndex,
    required TResult orElse(),
  }) {
    if (changePageIndex != null) {
      return changePageIndex(newPageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePageIndex value) changePageIndex,
  }) {
    return changePageIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangePageIndex value)? changePageIndex,
  }) {
    return changePageIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePageIndex value)? changePageIndex,
    required TResult orElse(),
  }) {
    if (changePageIndex != null) {
      return changePageIndex(this);
    }
    return orElse();
  }
}

abstract class _ChangePageIndex implements NavEvent {
  const factory _ChangePageIndex(final PageIndex newPageIndex) =
      _$ChangePageIndexImpl;

  @override
  PageIndex get newPageIndex;
  @override
  @JsonKey(ignore: true)
  _$$ChangePageIndexImplCopyWith<_$ChangePageIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NavState {
  PageIndex get pageIndex => throw _privateConstructorUsedError;
  Map<PageIndex, GlobalKey<NavigatorState>> get navigatorKeys =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavStateCopyWith<NavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavStateCopyWith<$Res> {
  factory $NavStateCopyWith(NavState value, $Res Function(NavState) then) =
      _$NavStateCopyWithImpl<$Res, NavState>;
  @useResult
  $Res call(
      {PageIndex pageIndex,
      Map<PageIndex, GlobalKey<NavigatorState>> navigatorKeys});
}

/// @nodoc
class _$NavStateCopyWithImpl<$Res, $Val extends NavState>
    implements $NavStateCopyWith<$Res> {
  _$NavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? navigatorKeys = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as PageIndex,
      navigatorKeys: null == navigatorKeys
          ? _value.navigatorKeys
          : navigatorKeys // ignore: cast_nullable_to_non_nullable
              as Map<PageIndex, GlobalKey<NavigatorState>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavStateImplCopyWith<$Res>
    implements $NavStateCopyWith<$Res> {
  factory _$$NavStateImplCopyWith(
          _$NavStateImpl value, $Res Function(_$NavStateImpl) then) =
      __$$NavStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageIndex pageIndex,
      Map<PageIndex, GlobalKey<NavigatorState>> navigatorKeys});
}

/// @nodoc
class __$$NavStateImplCopyWithImpl<$Res>
    extends _$NavStateCopyWithImpl<$Res, _$NavStateImpl>
    implements _$$NavStateImplCopyWith<$Res> {
  __$$NavStateImplCopyWithImpl(
      _$NavStateImpl _value, $Res Function(_$NavStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? navigatorKeys = null,
  }) {
    return _then(_$NavStateImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as PageIndex,
      navigatorKeys: null == navigatorKeys
          ? _value._navigatorKeys
          : navigatorKeys // ignore: cast_nullable_to_non_nullable
              as Map<PageIndex, GlobalKey<NavigatorState>>,
    ));
  }
}

/// @nodoc

class _$NavStateImpl implements _NavState {
  const _$NavStateImpl(
      {required this.pageIndex,
      required final Map<PageIndex, GlobalKey<NavigatorState>> navigatorKeys})
      : _navigatorKeys = navigatorKeys;

  @override
  final PageIndex pageIndex;
  final Map<PageIndex, GlobalKey<NavigatorState>> _navigatorKeys;
  @override
  Map<PageIndex, GlobalKey<NavigatorState>> get navigatorKeys {
    if (_navigatorKeys is EqualUnmodifiableMapView) return _navigatorKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_navigatorKeys);
  }

  @override
  String toString() {
    return 'NavState(pageIndex: $pageIndex, navigatorKeys: $navigatorKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavStateImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            const DeepCollectionEquality()
                .equals(other._navigatorKeys, _navigatorKeys));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageIndex,
      const DeepCollectionEquality().hash(_navigatorKeys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavStateImplCopyWith<_$NavStateImpl> get copyWith =>
      __$$NavStateImplCopyWithImpl<_$NavStateImpl>(this, _$identity);
}

abstract class _NavState implements NavState {
  const factory _NavState(
      {required final PageIndex pageIndex,
      required final Map<PageIndex, GlobalKey<NavigatorState>>
          navigatorKeys}) = _$NavStateImpl;

  @override
  PageIndex get pageIndex;
  @override
  Map<PageIndex, GlobalKey<NavigatorState>> get navigatorKeys;
  @override
  @JsonKey(ignore: true)
  _$$NavStateImplCopyWith<_$NavStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
