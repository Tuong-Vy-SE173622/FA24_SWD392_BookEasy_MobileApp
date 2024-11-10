// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SettingPage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Setting',
//           style: TextStyle(
//               color: Colors.blueAccent,
//               fontWeight: FontWeight.bold,
//               fontSize: 27),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: ,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bookeasy/services/auth_service.dart'; // Import AuthService
import 'package:go_router/go_router.dart'; // For navigation

class SettingPage extends StatelessWidget {
  // Create an instance of AuthService to handle the logout
  final AuthService _authService = AuthService();

  Future<void> _logout(BuildContext context) async {
    try {
      await _authService.logout();
      // After logout, navigate to the login page
      context.go('/login');
    } catch (e) {
      // Handle any error that occurs during logout
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Color.fromARGB(255, 145, 200, 255),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Other settings options can be added here

              // Logout Button
              Center(
                child: ElevatedButton(
                  onPressed: () => _logout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .blueAccent, // Set the button color to red for Logout
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
