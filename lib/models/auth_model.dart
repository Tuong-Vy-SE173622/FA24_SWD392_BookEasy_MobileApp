// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class AuthModel {
//   String? verificationToken;
//   String? resetToken;
//   String? userId;
//   String? username;
//   String? email;
//   String? roleName;

//   AuthModel({
//     this.verificationToken,
//     this.resetToken,
//     this.userId,
//     this.username,
//     this.email,
//     this.roleName,
//   });

//   factory AuthModel.fromJson(Map<String, dynamic> json) {
//     return AuthModel(
//       verificationToken: json['verificationToken'],
//       resetToken: json['resetToken'],
//       userId: json['userId'],
//       username: json['username'],
//       email: json['email'],
//       roleName: json['roleName'],
//     );
//   }

//   static Future<AuthModel?> login(String username, String password) async {
//     const String url =
//         'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/authenticate/login';
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'userName': username, 'password': password}),
//       );

//       if (response.statusCode == 200) {
//         return AuthModel.fromJson(jsonDecode(response.body));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
// }

import 'dart:convert';

class AuthModel {
  String? verificationToken;
  String? resetToken;
  String? userId;
  String? username;
  String? email;
  String? roleName;

  AuthModel({
    this.verificationToken,
    this.resetToken,
    this.userId,
    this.username,
    this.email,
    this.roleName,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      verificationToken: json['verificationToken'],
      resetToken: json['resetToken'],
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      roleName: json['roleName'],
    );
  }
}
