// import 'package:flutter/material.dart';
// // import 'pages/login.dart'; // Import the Login screen\
// import 'routers/route.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: router.routerDelegate,
//       routeInformationParser: router.routeInformationParser,
//     );
//   }
// }

import 'package:bookeasy/routers/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'routers/route.dart'; // Import router

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BookEasy', // Tiêu đề ứng dụng
      routerConfig: AppRouter.goRouter(),
    );
  }
}
