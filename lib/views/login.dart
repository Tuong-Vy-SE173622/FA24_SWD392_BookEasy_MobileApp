import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formLoginKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool _isPasswordVisible =
      false; // Biến để theo dõi trạng thái hiển thị mật khẩu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 117, 230),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 230,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              decoration: BoxDecoration(
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
                          color: const Color.fromARGB(255, 5, 117, 230),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.black, // Màu văn bản nhập vào
                        ),
                        decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 117, 230)),
                          ),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(color: Colors.black26),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 117, 230)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 117, 230)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 117, 230),
                                width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        obscureText:
                            !_isPasswordVisible, // Trạng thái hiển thị mật khẩu
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.black, // Màu văn bản nhập vào
                        ),
                        decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 117, 230)),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 117, 230)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 117, 230)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 5, 117, 230),
                                width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons
                                      .visibility // Biểu tượng khi mật khẩu hiển thị
                                  : Icons
                                      .visibility_off, // Biểu tượng khi mật khẩu ẩn
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                    !_isPasswordVisible; // Thay đổi trạng thái
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 5, 117, 230),
                          ),
                          onPressed: () {
                            GoRouter.of(context).go('/home');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Or',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Khoảng cách giữa chữ "Or" và nút Google
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 5, 117, 230),
                              width: 1), // Border màu xanh
                          borderRadius: BorderRadius.circular(70),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color.fromARGB(255, 0, 0, 0)
                          //         .withOpacity(0.2), // Shadow nhẹ
                          //     spreadRadius: 1,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 3), // Đổi vị trí shadow
                          //   ),
                          // ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Thực hiện chức năng đăng nhập với Google ở đây
                          },
                          icon: Image.asset(
                            'assets/images/google_icon.png', // Đường dẫn tới icon Google
                            height: 30, // Tăng kích thước hình ảnh Google
                            width: 30, // Tăng kích thước hình ảnh Google
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 11,
                                horizontal: 50), // Tăng khoảng cách dọc
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/item-1.png',
                          width: 320,
                          // height: 200,
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
}
