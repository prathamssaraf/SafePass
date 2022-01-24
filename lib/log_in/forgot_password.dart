import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.teal[400],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProximaSoft',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              gapPadding: 4,
                              borderSide: BorderSide()),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              gapPadding: 10,
                              borderSide: BorderSide()),
                          hintText: "Enter your your Email",
                          labelText: "Email Id",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/icons/User.svg",
                              fit: BoxFit.scaleDown,
                              height: 10,
                              // scale: 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.teal[400],
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'ProximaSoft',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              gapPadding: 4,
                              borderSide: BorderSide()),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              gapPadding: 10,
                              borderSide: BorderSide()),
                          hintText: "Enter your your phone number",
                          labelText: "Phone Number",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/icons/Phone.svg",
                              fit: BoxFit.scaleDown,
                              height: 8,
                              // scale: 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/completeprofile",
                    );
                  },
                  child: Text(
                    'Send Password',
                    softWrap: false,
                    overflow: TextOverflow.visible,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[300],
                    textStyle: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaSoft"),
                    padding: EdgeInsets.symmetric(horizontal: 88, vertical: 18),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: Text('Sign In'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/loginpage",
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
