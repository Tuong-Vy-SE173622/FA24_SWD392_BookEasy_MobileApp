// import 'package:flutter/material.dart';

// class AccountPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Account',
//           style: TextStyle(
//             color: Colors.blueAccent,
//             fontWeight: FontWeight.bold,
//             fontSize: 27,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         color: Color.fromARGB(255, 145, 200, 255),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Text('Account'),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bookeasy/controllers/user_controller.dart';
import 'package:bookeasy/models/user_model.dart';

class AccountPage extends StatelessWidget {
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
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
        width: screenWidth,
        color: Color.fromARGB(255, 145, 200, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<UserModel?>(
            future:
                _userController.fetchUser(), // Fetch user data asynchronously
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return Center(child: Text('No user data available'));
              }

              // If user data is available, display it
              final user = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name: ${user.fullName}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Username: ${user.userName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email: ${user.email}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Phone: ${user.phoneNumber}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
