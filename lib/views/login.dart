// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:bookeasy/controllers/auth_controller.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formLoginKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AuthController _authController = AuthController();
//   bool _isPasswordVisible = false;
//   bool _isLoading = false;

//   void _login() async {
//     if (_formLoginKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       final authModel = await _authController.login(
//         _usernameController.text,
//         _passwordController.text,
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (authModel != null) {
//         GoRouter.of(context).go('/home');
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Login Failed'),
//             content: const Text('Invalid username or password.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 5, 117, 230),
//       body: Column(
//         children: [
//           const SizedBox(height: 30),
//           Center(
//             child: Image.asset(
//               'assets/images/logo.png',
//               width: 230,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formLoginKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Welcome back',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w900,
//                           color: Color.fromARGB(255, 5, 117, 230),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       _buildTextField(
//                           controller: _usernameController,
//                           label: 'Username',
//                           hintText: 'Enter Username',
//                           validatorMsg: 'Please enter Username'),
//                       const SizedBox(height: 25),
//                       _buildTextField(
//                           controller: _passwordController,
//                           label: 'Password',
//                           hintText: 'Enter Password',
//                           validatorMsg: 'Please enter Password',
//                           obscureText: !_isPasswordVisible,
//                           isPassword: true),
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _login,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 5, 117, 230),
//                           ),
//                           child: _isLoading
//                               ? CircularProgressIndicator(color: Colors.white)
//                               : const Text(
//                                   'Login',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const Center(
//                         child: Text(
//                           'Or',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       _buildGoogleButton(),
//                       const SizedBox(height: 120),
//                       Center(
//                         child: Image.asset(
//                           'assets/images/item-1.png',
//                           width: 320,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hintText,
//     required String validatorMsg,
//     bool obscureText = false,
//     bool isPassword = false,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       validator: (value) =>
//           value == null || value.isEmpty ? validatorMsg : null,
//       decoration: InputDecoration(
//         label: Text(
//           label,
//           style: TextStyle(color: Color.fromARGB(255, 5, 117, 230)),
//         ),
//         hintText: hintText,
//         fillColor: Colors.white,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color.fromARGB(255, 5, 117, 230)),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color.fromARGB(255, 5, 117, 230)),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//               color: Color.fromARGB(255, 5, 117, 230), width: 2),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.red, width: 2),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         suffixIcon: isPassword
//             ? IconButton(
//                 icon: Icon(
//                   obscureText ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               )
//             : null,
//       ),
//     );
//   }

//   Widget _buildGoogleButton() {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromARGB(255, 5, 117, 230), width: 1),
//         borderRadius: BorderRadius.circular(70),
//       ),
//       child: ElevatedButton.icon(
//         onPressed: () {
//           // Thực hiện chức năng đăng nhập với Google ở đây
//         },
//         icon: Image.asset(
//           'assets/images/google_icon.png',
//           height: 30,
//           width: 30,
//         ),
//         label: const Text(
//           'Login with Google',
//           style: TextStyle(
//               color: Color.fromARGB(255, 5, 117, 230),
//               fontWeight: FontWeight.w600,
//               fontSize: 18),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 50),
//         ),
//       ),
//     );
//   }
// }

//--------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:bookeasy/controllers/auth_controller.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formLoginKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AuthController _authController = AuthController();
//   bool _isPasswordVisible = false;
//   bool _isLoading = false;

//   void _login() async {
//     if (_formLoginKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       final authModel = await _authController.login(
//         _usernameController.text,
//         _passwordController.text,
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (authModel != null) {
//         GoRouter.of(context).go('/home');
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Login Failed'),
//             content: const Text('Invalid username or password.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 5, 117, 230),
//       body: Column(
//         children: [
//           const SizedBox(height: 30),
//           Center(
//             child: Image.asset(
//               'assets/images/logo.png',
//               width: 230,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formLoginKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Welcome back',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w900,
//                           color: Color.fromARGB(255, 5, 117, 230),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       _buildTextField(
//                           controller: _usernameController,
//                           label: 'Username',
//                           hintText: 'Enter Username',
//                           validatorMsg: 'Please enter Username'),
//                       const SizedBox(height: 25),
//                       _buildTextField(
//                           controller: _passwordController,
//                           label: 'Password',
//                           hintText: 'Enter Password',
//                           validatorMsg: 'Please enter Password',
//                           obscureText: !_isPasswordVisible,
//                           isPassword: true),
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _login,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 5, 117, 230),
//                           ),
//                           child: _isLoading
//                               ? CircularProgressIndicator(color: Colors.white)
//                               : const Text(
//                                   'Login',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const Center(
//                         child: Text(
//                           'Or',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       _buildGoogleButton(),
//                       const SizedBox(height: 120),
//                       Center(
//                         child: Image.asset(
//                           'assets/images/item-1.png',
//                           width: 320,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hintText,
//     required String validatorMsg,
//     bool obscureText = false,
//     bool isPassword = false,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       validator: (value) =>
//           value == null || value.isEmpty ? validatorMsg : null,
//       decoration: InputDecoration(
//         label: Text(
//           label,
//           style: TextStyle(color: Color.fromARGB(255, 5, 117, 230)),
//         ),
//         hintText: hintText,
//         fillColor: Colors.white,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color.fromARGB(255, 5, 117, 230)),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color.fromARGB(255, 5, 117, 230)),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//               color: Color.fromARGB(255, 5, 117, 230), width: 2),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.red, width: 2),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         suffixIcon: isPassword
//             ? IconButton(
//                 icon: Icon(
//                   obscureText ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               )
//             : null,
//       ),
//     );
//   }

//   Widget _buildGoogleButton() {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromARGB(255, 5, 117, 230), width: 1),
//         borderRadius: BorderRadius.circular(70),
//       ),
//       child: ElevatedButton.icon(
//         onPressed: () {
//           // Thực hiện chức năng đăng nhập với Google ở đây
//         },
//         icon: Image.asset(
//           'assets/images/google_icon.png',
//           height: 30,
//           width: 30,
//         ),
//         label: const Text(
//           'Login with Google',
//           style: TextStyle(
//               color: Color.fromARGB(255, 5, 117, 230),
//               fontWeight: FontWeight.w600,
//               fontSize: 18),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 50),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formLoginKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  void _login() async {
    if (_formLoginKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final authModel = await _authController.login(
        _usernameController.text,
        _passwordController.text,
      );

      setState(() => _isLoading = false);

      if (authModel != null) {
        GoRouter.of(context).go('/home');
      } else {
        _showErrorDialog();
      }
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: const Text('Invalid username or password.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 117, 230),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 230,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formLoginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 5, 117, 230),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildTextField(
                          controller: _usernameController,
                          label: 'Username',
                          hintText: 'Enter Username',
                          validatorMsg: 'Please enter Username'),
                      const SizedBox(height: 25),
                      _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          hintText: 'Enter Password',
                          validatorMsg: 'Please enter Password',
                          obscureText: !_isPasswordVisible,
                          isPassword: true),
                      const SizedBox(height: 30),
                      _buildLoginButton(),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'Or',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildGoogleButton(),
                      const SizedBox(height: 120),
                      Center(
                        child: Image.asset(
                          'assets/images/item-1.png',
                          width: 320,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 5, 117, 230),
        ),
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required String validatorMsg,
    bool obscureText = false,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) =>
          value == null || value.isEmpty ? validatorMsg : null,
      decoration: InputDecoration(
        // labelText: label,
        // hintText: hintText,
        // border: OutlineInputBorder(),
        label: Text(
          label,
          style: TextStyle(color: Color.fromARGB(255, 5, 117, 230)),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 5, 117, 230)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 5, 117, 230)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 5, 117, 230), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }

  Widget _buildGoogleButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 5, 117, 230), width: 1),
        borderRadius: BorderRadius.circular(70),
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          // Thực hiện chức năng đăng nhập với Google ở đây
        },
        icon: Image.asset(
          'assets/images/google_icon.png',
          height: 30,
          width: 30,
        ),
        label: const Text(
          'Login with Google',
          style: TextStyle(
              color: Color.fromARGB(255, 5, 117, 230),
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 50),
        ),
      ),
    );
  }
}
