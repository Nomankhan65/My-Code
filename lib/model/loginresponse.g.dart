// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      otpExpiry: (json['otpExpiry'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      authToken: json['authToken'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'otpExpiry': instance.otpExpiry,
      'userId': instance.userId,
      'authToken': instance.authToken,
    };
