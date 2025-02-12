class UserModel {
  final int id;
  final String fullName;
  final String image;

  UserModel({
    required this.id,
    required this.fullName,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullname'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullName,
      'image': image,
    };
  }
}

class AllBeneficiaries {
  final bool error;
  final String message;
  final List<UserModel> data;

  AllBeneficiaries({
    required this.error,
    required this.message,
    required this.data,
  });

  factory AllBeneficiaries.fromJson(Map<String, dynamic> json) {
    return AllBeneficiaries(
      error: json['error'],
      message: json['message'],
      data: (json['data'] as List).map((e) => UserModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
