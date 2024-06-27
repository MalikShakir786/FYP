//
// class UserListModel {
//   final int status;
//   final String message;
//   final dynamic data;
//
//   UserListModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   factory UserListModel.fromJson(Map<String, dynamic> json) {
//     if (json.containsKey('data')) {
//       final dynamic data = json['data'];
//
//       if (data is List) {
//         // If data is a list, handle it as a CheckUser
//         return UserListModel(
//           status: json['status'],
//           message: json['message'],
//           data: CheckUser.fromJson(json['data']),
//         );
//       } else if (data is Map<String, dynamic>) {
//         // If data is a map, handle it as a single User
//         return UserListModel(
//           status: json['status'],
//           message: json['message'],
//           data: User.fromJson(data),
//         );
//       }
//     }
//
//     // Handle any other cases where data structure is unexpected
//     throw FormatException('Unexpected data structure in UserListModel');
//   }
// }
//
// class CheckUser {
//   final List<User> admin;
//   final List<User> student;
//
//   CheckUser({
//     required this.admin,
//     required this.student,
//   });
//
//   factory CheckUser.fromJson(Map<String, dynamic> json) {
//     List<User> adminList = (json['admin'] as List)
//         .map((item) => User.fromJson(item))
//         .toList();
//
//     List<User> studentList = (json['student'] as List)
//         .map((item) => User.fromJson(item))
//         .toList();
//
//     return CheckUser(
//       admin: adminList,
//       student: studentList,
//     );
//   }
// }
//
// class User {
//   final int userId;
//   final String userEmail;
//   String userName;
//   final String userPassword;
//   String userType;
//
//   User({
//     required this.userId,
//     required this.userEmail,
//     required this.userName,
//     required this.userPassword,
//     required this.userType,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       userId: json['user_id'] ?? 0,
//       userEmail: json['user_email'],
//       userName: json['user_name'],
//       userPassword: json['user_password'],
//       userType: json['user_type'],
//     );
//   }
// }

class UserListModel {
  final int status;
  final String message;
  final CheckUser data;

  UserListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
      status: json['status'],
      message: json['message'],
      data: CheckUser.fromJson(json['data']),
    );
  }
}

class CheckUser{
  final List<User> admin;
  final List<User> student;

  CheckUser({
    required this.admin,
    required this.student,
  });

  factory CheckUser.fromJson(Map<String, dynamic> json) {
    List<User> adminList = (json['admin'] as List)
        .map((item) => User.fromJson(item))
        .toList();

    List<User> studentList = (json['student'] as List)
        .map((item) => User.fromJson(item))
        .toList();

    return CheckUser(
      admin: adminList,
      student: studentList,
    );
  }
}

class User {
  final int userId;
  final String userEmail;
  final String userName;
  final String userPassword;
  final String userType;

  User({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.userPassword,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      userEmail: json['user_email'],
      userName: json['user_name'],
      userPassword: json['user_password'],
      userType: json['user_type'],
    );
  }
}

