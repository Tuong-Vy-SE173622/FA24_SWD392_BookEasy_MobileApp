// import 'package:bookeasy/routers/route.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_dotenv/flutter_dotenv.dart';

// void main() async {
//   // await dotenv.load(fileName: ".env");
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'BookEasy', // Tiêu đề ứng dụng
//       routerConfig: AppRouter.goRouter(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bookeasy/routers/route.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BookEasy',
      routerConfig: AppRouter.goRouter(navigatorKey),
    );
  }
}
