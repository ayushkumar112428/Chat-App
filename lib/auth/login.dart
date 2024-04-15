import 'package:chatapp/service/firebase_auth_service.dart';
import 'package:chatapp/auth/sinup.dart';
import 'package:chatapp/screens/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.3),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _email,
                        cursorColor: Colors.grey,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: "Enter a email",
                          label: const Text("Your Email"),
                          labelStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _password,
                        cursorColor: Colors.grey,
                        obscureText: _isObscure,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: "Enter a password",
                          label: const Text("Password"),
                          labelStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 20,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a Password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.3),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _signIn(context);
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
                            child: Text("Log in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                          child: Text(
                        "Or Log in with social account",
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
                          onTap: () {
                            _signInWithGoogle(context);
                          },
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
                  bottom: 25,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn(context) async {
    //auth service
    final authService = FirebaseAuthService();
    // try to login
    try{
      await authService.signInWithEmailAndPassword(_email.text, _password.text);
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()),);
    }
    // catch the error
    catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }
    // String email = _email.text;
    // String password = _password.text;
    // User? user = await _auth.signInWithEmailAndPassword(email, password);
    // if(user != null){
    //   print('user is login');
    //   Toast.show("User is login!");
    //   Navigator.popUntil(context, (route) => route.isFirst);
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()),);
    // }
    // else{
    //   // print('error');
    //   Toast.show('error');
    // }
  }
  _signInWithGoogle(context) async {
    // final GoogleSignIn googleSignIn = GoogleSignIn();

    // try {
    //   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    //   if (googleSignInAccount != null) {
    //     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    //     final AuthCredential credential = GoogleAuthProvider.credential(
    //       idToken: googleSignInAuthentication.idToken,
    //       accessToken: googleSignInAuthentication.accessToken,
    //     );

    //     await _firebaseAuth.signInWithCredential(credential);

    //     Navigator.popUntil(context, (route) => route.isFirst);
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()),);
    //   }
    // } catch (e) {
    //   Toast.show("some error occurred $e");
    // }
  }
}
