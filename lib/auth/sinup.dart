import 'package:chatapp/service/firebase_auth_service.dart';
import 'package:chatapp/auth/login.dart';
import 'package:chatapp/screens/home.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      textBox(_username, false, "Enter a user name", "User name",
                          (String? value) {
                        if (value!.isEmpty) {
                          return "Enter a user name";
                        }
                        return null;
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      textBox(_email, false, "Enter a email", "Email",
                          (String? value) {
                        if (value!.isEmpty) {
                          return "Enter a email";
                        }
                        return null;
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      textBox(_password, true, "Enter a password", "Password",
                          (String? value) {
                        if (value!.isEmpty) {
                            return "Enter a password";
                          } else if (value.length < 6) {
                            return "Minimum 6 number";
                          }
                          return null;
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      textBox(_confirmpassword, true, "Enter a confirm password", "Confirm Password",
                          (String? value) {
                        if (value!.isEmpty) {
                            return "Enter a password";
                          } else if (value != _password.text) {
                            return "Not Match Password!";
                          }
                          return null;
                      }),
                      const SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _signUP(context);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                          child: Text(
                        "Or Sign up with social account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: InkWell(
                          child: Container(
                            height: 45,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/google.webp",
                                  height: 28,
                                  width: 28,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Google",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: SizedBox(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "By signing up you agree to our ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "terms of use",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: "\nand ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "privacy policy",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textBox(TextEditingController controller, bool obscureText,
      String hintText, String label, String? Function(String?) validator) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.grey,
      style: const TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label),
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 20,
        ),
      ),
      validator: validator,
    );
  }

  void _signUP(context) async {
    //grt auth service
    final auth = FirebaseAuthService();

    //try to create a new account
    try {
      await auth.signUpWithEmailAndPassword(
          _email.text, _password.text, _username.text);
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
    // String userName = _username.text;
    // String email = _email.text;
    // String password = _password.text;
    // print(userName);
    // print(password);
    // User? user = await _auth.signUpWithEmailAndPassword(email, password);
    // if (user != null) {
    //   print('user is created ');
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const LoginPage()),
    //   );
    // } else {
    //   print('error');
    // }
  }
}
