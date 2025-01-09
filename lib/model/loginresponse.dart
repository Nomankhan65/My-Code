import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginresponse.freezed.dart';
part 'loginresponse.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String status,
    required String message,
    int? otpExpiry,
    String? userId,
    String? authToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
