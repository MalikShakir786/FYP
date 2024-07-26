class UserModel {
  final int status;
  final String message;
  final UserData data;

  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData{
  final int userId;
  final String userEmail;
  String userName;
  String userType;

  UserData({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.userType,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['user_id'],
      userEmail: json['user_email'],
      userName: json['user_name'],
      userType: json['user_type'],
    );
  }
}