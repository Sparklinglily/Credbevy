import 'package:credbevy/data/models/all_beneficiaries.dart';

class UserSingleResponse {
  final bool error;
  final String message;
  final UserModel data;

  UserSingleResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory UserSingleResponse.fromJson(Map<String, dynamic> json) {
    return UserSingleResponse(
      error: json['error'],
      message: json['message'],
      data: UserModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.toJson(),
    };
  }
}
