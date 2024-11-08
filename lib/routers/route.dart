import 'package:bookeasy/views/event_group_guest.dart';
import 'package:bookeasy/views/event_guest.dart';
import 'package:bookeasy/views/home.dart';
import 'package:bookeasy/views/login.dart';
import 'package:bookeasy/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter goRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'Splash Page',
          builder: (context, state) {
            return SplashScreen();
          },
        ),
        GoRoute(
          path: '/login',
          name: 'Login Page',
          builder: (context, state) => LoginScreen(),
        ),
        ShellRoute(
          routes: [
            GoRoute(
              path: '/home',
              name: 'Home Page',
              builder: (context, state) => HomePage(),
            ),
            GoRoute(
              path: '/event/:eventID',
              name: 'Event Page',
              builder: (context, state) {
                final eventID = int.parse(state.pathParameters['eventID']!);
                final eventName =
                    'Event Name'; // Placeholder for actual event name
                return EventGroupGuestPage(
                    eventID: eventID, eventName: eventName);
              },
            ),
            GoRoute(
              path: '/guest/:guestGroupID',
              builder: (BuildContext context, GoRouterState state) {
                final guestGroupID =
                    int.parse(state.pathParameters['guestGroupID']!);
                return GuestListPage(guestGroupID: guestGroupID);
              },
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
            // Determine the current index based on the current URI path
            int currentPageIndex = 0;
            switch (state.uri.path) {
              case '/home':
                currentPageIndex = 0;
                break;
              case '/account':
                currentPageIndex = 1;
                break;
              case '/settings':
                currentPageIndex = 2;
                break;
              default:
                currentPageIndex = 0; // Default to Home if path is unrecognized
            }

            return Scaffold(
              body: child,
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
                indicatorColor: Color.fromARGB(255, 145, 200, 255),
                height: 100,
              ),
            );
          },
        ),
      ],
    );
  }
}
