import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Để sử dụng Future.delayed

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Thực hiện chuyển hướng sau 2 giây
    Future.delayed(Duration(seconds: 3), () {
      // Điều hướng đến trang login
      context.go('/login');
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 117, 230),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
