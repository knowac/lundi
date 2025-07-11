// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Poi {

@HiveField(0) String get id;@HiveField(1) double get longitude;@HiveField(2) double get latitude;
/// Create a copy of Poi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoiCopyWith<Poi> get copyWith => _$PoiCopyWithImpl<Poi>(this as Poi, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Poi&&(identical(other.id, id) || other.id == id)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,longitude,latitude);

@override
String toString() {
  return 'Poi(id: $id, longitude: $longitude, latitude: $latitude)';
}


}

/// @nodoc
abstract mixin class $PoiCopyWith<$Res>  {
  factory $PoiCopyWith(Poi value, $Res Function(Poi) _then) = _$PoiCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) double longitude,@HiveField(2) double latitude
});




}
/// @nodoc
class _$PoiCopyWithImpl<$Res>
    implements $PoiCopyWith<$Res> {
  _$PoiCopyWithImpl(this._self, this._then);

  final Poi _self;
  final $Res Function(Poi) _then;

/// Create a copy of Poi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? longitude = null,Object? latitude = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Poi].
extension PoiPatterns on Poi {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Poi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Poi() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Poi value)  $default,){
final _that = this;
switch (_that) {
case _Poi():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Poi value)?  $default,){
final _that = this;
switch (_that) {
case _Poi() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  double longitude, @HiveField(2)  double latitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Poi() when $default != null:
return $default(_that.id,_that.longitude,_that.latitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  double longitude, @HiveField(2)  double latitude)  $default,) {final _that = this;
switch (_that) {
case _Poi():
return $default(_that.id,_that.longitude,_that.latitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  double longitude, @HiveField(2)  double latitude)?  $default,) {final _that = this;
switch (_that) {
case _Poi() when $default != null:
return $default(_that.id,_that.longitude,_that.latitude);case _:
  return null;

}
}

}

/// @nodoc

@HiveType(typeId: 0)
class _Poi extends Poi {
   _Poi({@HiveField(0) required this.id, @HiveField(1) required this.longitude, @HiveField(2) required this.latitude}): super._();
  

@override@HiveField(0) final  String id;
@override@HiveField(1) final  double longitude;
@override@HiveField(2) final  double latitude;

/// Create a copy of Poi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoiCopyWith<_Poi> get copyWith => __$PoiCopyWithImpl<_Poi>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Poi&&(identical(other.id, id) || other.id == id)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,longitude,latitude);

@override
String toString() {
  return 'Poi(id: $id, longitude: $longitude, latitude: $latitude)';
}


}

/// @nodoc
abstract mixin class _$PoiCopyWith<$Res> implements $PoiCopyWith<$Res> {
  factory _$PoiCopyWith(_Poi value, $Res Function(_Poi) _then) = __$PoiCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) double longitude,@HiveField(2) double latitude
});




}
/// @nodoc
class __$PoiCopyWithImpl<$Res>
    implements _$PoiCopyWith<$Res> {
  __$PoiCopyWithImpl(this._self, this._then);

  final _Poi _self;
  final $Res Function(_Poi) _then;

/// Create a copy of Poi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? longitude = null,Object? latitude = null,}) {
  return _then(_Poi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
