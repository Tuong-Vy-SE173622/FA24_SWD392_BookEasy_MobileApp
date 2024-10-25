import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formLoginKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 5, 117, 230),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 250,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Form(
                    key: _formLoginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 5, 117, 230)),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: const Text('Email'),
                              hintText: 'Enter Email',
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 5, 117, 230)),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 5, 117, 230)),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: Text('Password'),
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 5, 117, 230)),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 5, 117, 230)),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberPassword,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      setState(() {
                                        rememberPassword = value;
                                      });
                                    }
                                  },
                                  activeColor:
                                      const Color.fromARGB(255, 5, 117, 230),
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.black45),
                                )
                              ],
                            ),
                            // GestureDetector(

                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 165, 210, 255)),
                              onPressed: () {
                                // if (_formLoginKey.currentState!.validate()) {
                                //   if (rememberPassword) {
                                //     // Xử lý đăng nhập khi đã chọn "Remember me"
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text('Processing Data')),
                                //     );
                                //     GoRouter.of(context).go('/home');
                                //   } else {
                                //     // Nếu chưa chọn "Remember me"
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text(
                                //               'Please agree to remember your password.')),
                                //     );
                                //   }
                                // }
                                GoRouter.of(context).go('/home');
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 117, 230),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800),
                              )),
                        )
                      ],
                    )),
              ),
            ))
          ],
        ));
  }
}
