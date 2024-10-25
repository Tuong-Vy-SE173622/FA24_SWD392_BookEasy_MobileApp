import 'package:bookeasy/pages/login.dart';
import 'package:bookeasy/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter goRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'incon page',
          builder: (context, state) {
            return SplashScreen();
          },
        ),
        GoRoute(
          path: '/login',
          name: 'Login Page',
          builder: (context, state) => LoginScreen(),
        ),
        // ShellRoute(
        //   routes: [
        //     GoRoute(
        //       path: '/home',
        //       name: 'Home Page',
        //       builder: (context, state) => Container(
        //         child: Center(
        //           child: Text('Home page'),
        //         ),
        //       ),
        //     )
        //   ],
        //   builder: (context, state, child) => NavigationBar(
        //     destinations: [
        //       NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        //       NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
        //       NavigationDestination(
        //           icon: Icon(Icons.settings), label: 'Setting')
        //     ],
        //     backgroundColor: const Color.fromARGB(255, 5, 117, 230),
        //     // selectedIndex: currentPageIndex,
        //   ),
        // )
        ShellRoute(
          routes: [
            GoRoute(
              path: '/home',
              name: 'Home Page',
              builder: (context, state) => const Center(
                child: Text('Home page'),
              ),
            ),
            GoRoute(
              path: '/account',
              name: 'Account Page',
              builder: (context, state) => const Center(
                child: Text('Account page'),
              ),
            ),
            GoRoute(
              path: '/settings',
              name: 'Settings Page',
              builder: (context, state) => const Center(
                child: Text('Settings page'),
              ),
            ),
          ],
          builder: (context, state, child) {
            int currentPageIndex = state.uri.toString() == '/home'
                ? 0
                : state.uri.toString() == '/account'
                    ? 1
                    : 2;

            return Scaffold(
              body:
                  // Column(
                  //   children: [
                  //     Expanded(child: child), // Đẩy nội dung lên trên
                  //   ],
                  // ),
                  Container(
                child: Expanded(child: child),
                color: Color.fromARGB(255, 5, 117, 230),
              ),
              bottomNavigationBar: NavigationBar(
                selectedIndex: currentPageIndex,
                onDestinationSelected: (index) {
                  switch (index) {
                    case 0:
                      context.go('/home');
                      break;
                    case 1:
                      context.go('/account');
                      break;
                    case 2:
                      context.go('/settings');
                      break;
                  }
                },
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.person), label: 'Account'),
                  NavigationDestination(
                      icon: Icon(Icons.settings), label: 'Setting'),
                ],
                backgroundColor: Colors.white,
                // animationDuration: Duration(microseconds: 1000),
                height: 100,
              ),
            );
          },
        ),
      ],
    );
  }
}
