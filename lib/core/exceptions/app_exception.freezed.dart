// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException()';
}


}

/// @nodoc
class $AppExceptionCopyWith<$Res>  {
$AppExceptionCopyWith(AppException _, $Res Function(AppException) __);
}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkException value)?  network,TResult Function( FirebaseAppException value)?  firebase,TResult Function( NoInternetAppException value)?  noInternet,TResult Function( ServerException value)?  server,TResult Function( UnknownException value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that);case FirebaseAppException() when firebase != null:
return firebase(_that);case NoInternetAppException() when noInternet != null:
return noInternet(_that);case ServerException() when server != null:
return server(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkException value)  network,required TResult Function( FirebaseAppException value)  firebase,required TResult Function( NoInternetAppException value)  noInternet,required TResult Function( ServerException value)  server,required TResult Function( UnknownException value)  unknown,}){
final _that = this;
switch (_that) {
case NetworkException():
return network(_that);case FirebaseAppException():
return firebase(_that);case NoInternetAppException():
return noInternet(_that);case ServerException():
return server(_that);case UnknownException():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkException value)?  network,TResult? Function( FirebaseAppException value)?  firebase,TResult? Function( NoInternetAppException value)?  noInternet,TResult? Function( ServerException value)?  server,TResult? Function( UnknownException value)?  unknown,}){
final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that);case FirebaseAppException() when firebase != null:
return firebase(_that);case NoInternetAppException() when noInternet != null:
return noInternet(_that);case ServerException() when server != null:
return server(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  int? statusCode)?  network,TResult Function( String code,  String message)?  firebase,TResult Function()?  noInternet,TResult Function( String message,  int? statusCode)?  server,TResult Function( String message,  Object? error)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that.message,_that.statusCode);case FirebaseAppException() when firebase != null:
return firebase(_that.code,_that.message);case NoInternetAppException() when noInternet != null:
return noInternet();case ServerException() when server != null:
return server(_that.message,_that.statusCode);case UnknownException() when unknown != null:
return unknown(_that.message,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  int? statusCode)  network,required TResult Function( String code,  String message)  firebase,required TResult Function()  noInternet,required TResult Function( String message,  int? statusCode)  server,required TResult Function( String message,  Object? error)  unknown,}) {final _that = this;
switch (_that) {
case NetworkException():
return network(_that.message,_that.statusCode);case FirebaseAppException():
return firebase(_that.code,_that.message);case NoInternetAppException():
return noInternet();case ServerException():
return server(_that.message,_that.statusCode);case UnknownException():
return unknown(_that.message,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  int? statusCode)?  network,TResult? Function( String code,  String message)?  firebase,TResult? Function()?  noInternet,TResult? Function( String message,  int? statusCode)?  server,TResult? Function( String message,  Object? error)?  unknown,}) {final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that.message,_that.statusCode);case FirebaseAppException() when firebase != null:
return firebase(_that.code,_that.message);case NoInternetAppException() when noInternet != null:
return noInternet();case ServerException() when server != null:
return server(_that.message,_that.statusCode);case UnknownException() when unknown != null:
return unknown(_that.message,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class NetworkException implements AppException {
  const NetworkException({required this.message, this.statusCode});
  

 final  String message;
 final  int? statusCode;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<NetworkException> get copyWith => _$NetworkExceptionCopyWithImpl<NetworkException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'AppException.network(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $NetworkExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(NetworkException value, $Res Function(NetworkException) _then) = _$NetworkExceptionCopyWithImpl;
@useResult
$Res call({
 String message, int? statusCode
});




}
/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._self, this._then);

  final NetworkException _self;
  final $Res Function(NetworkException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,}) {
  return _then(NetworkException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class FirebaseAppException implements AppException {
  const FirebaseAppException({required this.code, required this.message});
  

 final  String code;
 final  String message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirebaseAppExceptionCopyWith<FirebaseAppException> get copyWith => _$FirebaseAppExceptionCopyWithImpl<FirebaseAppException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirebaseAppException&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'AppException.firebase(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $FirebaseAppExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $FirebaseAppExceptionCopyWith(FirebaseAppException value, $Res Function(FirebaseAppException) _then) = _$FirebaseAppExceptionCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class _$FirebaseAppExceptionCopyWithImpl<$Res>
    implements $FirebaseAppExceptionCopyWith<$Res> {
  _$FirebaseAppExceptionCopyWithImpl(this._self, this._then);

  final FirebaseAppException _self;
  final $Res Function(FirebaseAppException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(FirebaseAppException(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoInternetAppException implements AppException {
  const NoInternetAppException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetAppException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.noInternet()';
}


}




/// @nodoc


class ServerException implements AppException {
  const ServerException({required this.message, this.statusCode});
  

 final  String message;
 final  int? statusCode;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerExceptionCopyWith<ServerException> get copyWith => _$ServerExceptionCopyWithImpl<ServerException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerException&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'AppException.server(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $ServerExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $ServerExceptionCopyWith(ServerException value, $Res Function(ServerException) _then) = _$ServerExceptionCopyWithImpl;
@useResult
$Res call({
 String message, int? statusCode
});




}
/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(this._self, this._then);

  final ServerException _self;
  final $Res Function(ServerException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,}) {
  return _then(ServerException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class UnknownException implements AppException {
  const UnknownException({required this.message, this.error});
  

 final  String message;
 final  Object? error;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownExceptionCopyWith<UnknownException> get copyWith => _$UnknownExceptionCopyWithImpl<UnknownException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownException&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'AppException.unknown(message: $message, error: $error)';
}


}

/// @nodoc
abstract mixin class $UnknownExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $UnknownExceptionCopyWith(UnknownException value, $Res Function(UnknownException) _then) = _$UnknownExceptionCopyWithImpl;
@useResult
$Res call({
 String message, Object? error
});




}
/// @nodoc
class _$UnknownExceptionCopyWithImpl<$Res>
    implements $UnknownExceptionCopyWith<$Res> {
  _$UnknownExceptionCopyWithImpl(this._self, this._then);

  final UnknownException _self;
  final $Res Function(UnknownException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,}) {
  return _then(UnknownException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
