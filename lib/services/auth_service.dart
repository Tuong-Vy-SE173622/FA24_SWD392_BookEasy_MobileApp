// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/auth_model.dart';

// class AuthService {
//   final String _loginUrl =
//       'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/authenticate/login';

//   Future<AuthModel?> login(String userName, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse(_loginUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'accept': '*/*',
//         },
//         body: json.encode({
//           'userName': userName,
//           'password': password,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         SharedPreferences prefs = await SharedPreferences.getInstance();

//         // Lưu trữ verificationToken và thời gian hết hạn
//         final verificationToken = data['verificationToken'];
//         final userID = data['userId'];
//         final expiryTime =
//             DateTime.now().add(Duration(minutes: 30)).millisecondsSinceEpoch;

//         await prefs.setString('verificationToken', verificationToken);
//         await prefs.setString('userID', userID);
//         await prefs.setInt('tokenExpiryTime', expiryTime);

//         // Trả về đối tượng AuthModel chứa thông tin đăng nhập
//         return AuthModel(verificationToken: verificationToken);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error during login: $e');
//       return null;
//     }
//   }

//   Future<void> logout() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('verificationToken');
//     await prefs.remove('tokenExpiryTime');
//   }

//   Future<String?> getVerificationToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('verificationToken');
//   }

//   Future<bool> isTokenExpired() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final expiryTime = prefs.getInt('tokenExpiryTime');
//     if (expiryTime != null) {
//       final currentTime = DateTime.now().millisecondsSinceEpoch;
//       return currentTime > expiryTime;
//     }
//     return true;
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:bookeasy/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../models/auth_model.dart';

class AuthService {
  final String _loginUrl =
      'https://eventcheckinmanagement-h7bggygec8esg5cd.southeastasia-01.azurewebsites.net/api/authenticate/login';

  Timer? _authCheckTimer;

  Future<AuthModel?> login(String userName, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: {
          'Content-Type': 'application/json',
          'accept': '*/*',
        },
        body: json.encode({
          'userName': userName,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // Lưu trữ verificationToken và thời gian hết hạn
        final verificationToken = data['verificationToken'];
        final userId = data['userId'];
        final expiryTime =
            DateTime.now().add(Duration(minutes: 30)).millisecondsSinceEpoch;

        await prefs.setString('verificationToken', verificationToken);
        await prefs.setString('userId', userId);
        await prefs.setInt('tokenExpiryTime', expiryTime);

        // Bắt đầu kiểm tra định kỳ
        _startAuthCheck();

        return AuthModel(verificationToken: verificationToken);
      } else {
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('verificationToken');
    await prefs.remove('tokenExpiryTime');
    _authCheckTimer?.cancel(); // Hủy kiểm tra khi đăng xuất
  }

  Future<bool> isTokenExpired() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final expiryTime = prefs.getInt('tokenExpiryTime');
    if (expiryTime != null) {
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      return currentTime > expiryTime;
    }
    return true;
  }

  void _startAuthCheck() {
    // Kiểm tra cứ sau mỗi phút
    _authCheckTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
      bool isExpired = await isTokenExpired();
      if (isExpired) {
        // Nếu token hết hạn, hủy Timer và điều hướng về /login
        timer.cancel();
        _authCheckTimer = null;
        logout();
        // Điều hướng về trang /login
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }
}
