import 'package:safepass/Password/page/notes_page.dart';
import 'package:safepass/sign_up/sign_up.dart';
import '/sign_up/complete_profile.dart';
import '/widget/googlesignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/utils/authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  bool _isObscure = true;
  Widget build(BuildContext context) {
    final my_blue = Colors.lightBlueAccent;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Material(
        color: Colors.black,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProximaSoft',
                ),
              ),
              // Image.asset("assets/images/lock.png"),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProximaSoft',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sign in with your email and password\nor continue with social media.",
                style: TextStyle(color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 10,
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        hintText: "Enter Username",
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.lightBlueAccent),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/icons/username.png",
                            height: 10,
                            scale: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 2,
                            borderSide: const BorderSide(
                                color: Colors.lightBlueAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: const BorderSide(
                                color: Colors.lightBlueAccent)),
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(color: Colors.white70),
                        labelText: "Password",
                        labelStyle:
                            const TextStyle(color: Colors.lightBlueAccent),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Image.asset(
                            "assets/icons/password.png",
                            height: 1,
                            width: 1,
                            scale: 2,
                          ),
                        ),
                        suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: Colors.white,
                        checkColor: Colors.lightBlueAccent,
                      ),
                      const Text(
                        "Remember Me",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "ProximaSoft"),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/forgotpassword",
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "ProximaSoft"),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        logInToFb();
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      textStyle: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaSoft"),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 138, vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Row(
                children: [
                  const Spacer(),
                  FutureBuilder(
                    future: Authentication.initializeFirebase(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error initializing Firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return GoogleSignInButton();
                      }
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: (SvgPicture.asset(
                  //     "assets/icons/twitter.svg",
                  //     height: 50,
                  //   )),
                  // ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: (Image.asset(
                  //     "assets/icons/facebook.png",
                  //     height: 1000,
                  //     // scale: 0.5,
                  //   )),
                  // ),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotesPage()),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(err.message),
              actions: [
                ElevatedButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
