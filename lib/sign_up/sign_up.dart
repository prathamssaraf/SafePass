// ignore_for_file: unnecessary_new

import 'package:safepass/utils/authentication.dart';
import 'package:safepass/widget/googlesignin.dart';

import '/log_in/login_page.dart';
import '/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

import 'complete_profile.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  bool _isObscure = true;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                "Sign Up",
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
              Text(
                "Register Account",
                style: TextStyle(
                  color: Colors.lightBlue[400],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProximaSoft',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Complete your details or continue\nwith social media.",
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
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 10,
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        hintText: "Enter your your email",
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.lightBlue),
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 2,
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.lightBlue),
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
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 2,
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        hintText: "Re-Enter Password",
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.lightBlue),
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
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    registerToFb();
                  }
                },
                child: const Text(' Submit '),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue[300],
                  textStyle: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaSoft"),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 118, vertical: 15),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text(
                    "Go back to login page",
                    style: TextStyle(color: Colors.white60),
                  )),

              Row(
                children: [
                  Spacer(),
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
                    width: 0,
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
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 0,
              ),

              Row(
                children: [
                  Spacer(),
                  Text(
                    "By continuing you confirm that you agree\nwith our Terms and Conditions",
                    style: TextStyle(color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     "Sign Up",
                  //     style: TextStyle(color: Colors.lightBlue[500]),
                  //   ),
                  // ),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user!.uid).set({
        "email": emailController.text,
      }).then((res) {
        isLoading = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CompleteProfile()),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
