// ignore_for_file: unnecessary_new

import '/model/form_model.dart';
import '/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _address = TextEditingController();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _lastnameController.dispose();

  //   super.dispose();
  // }
  final _formKey = GlobalKey<FormState>();
  final model =
      FormModel(address: '', firstname: '', lastname: '', phonenumber: '');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SingleChildScrollView(
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
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProximaSoft',
                ),
              ),
              // Image.asset("assets/images/lock.png"),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Complete Profile",
                style: TextStyle(
                  color: Colors.teal[400],
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
                style: TextStyle(color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a first name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.firstname = value!;
                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: const BorderSide(color: Colors.teal)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 10,
                            borderSide: const BorderSide(color: Colors.teal)),
                        hintText: "Enter your your firstname",
                        labelText: "FirstName",
                        hintStyle: const TextStyle(color: Colors.white70),
                        labelStyle: const TextStyle(color: Colors.teal),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a last name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.lastname = value!;
                      },
                      controller: _lastnameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: BorderSide(color: Colors.teal)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 10,
                            borderSide: const BorderSide(color: Colors.teal)),
                        hintText: "Enter your your lastname",
                        labelText: "LastName",
                        hintStyle: const TextStyle(color: Colors.white70),
                        labelStyle: const TextStyle(color: Colors.teal),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.phonenumber = value!;
                      },
                      controller: _phonenumber,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: const BorderSide(color: Colors.teal)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 10,
                            borderSide: const BorderSide(color: Colors.teal)),
                        hintText: "Enter your your phone number",
                        labelText: "Phone Number",
                        hintStyle: const TextStyle(color: Colors.white70),
                        labelStyle: const TextStyle(color: Colors.teal),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.address = value!;
                      },
                      controller: _address,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 4,
                            borderSide: const BorderSide(color: Colors.teal)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 10,
                            borderSide: const BorderSide(color: Colors.teal)),
                        hintText: "Enter your your address",
                        labelText: "Address",
                        hintStyle: const TextStyle(color: Colors.white70),
                        labelStyle: const TextStyle(color: Colors.teal),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/Location point.svg",
                            height: 10,
                            fit: BoxFit.scaleDown,
                            // scale: 6,
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
                height: 45,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  }
                  _sendDataToSecondScreen(context);
                },
                child: const Text('Continue'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[300],
                  textStyle: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaSoft"),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 118, vertical: 17),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "By continuing you confirm that you agree\nwith our Terms and Conditions",
                style: TextStyle(color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    // String firstname = _nameController.text;
    // String lastname = _lastnameController.text;
    // String address = _address.text;
    // String phone = _phonenumber.text;
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Profile(
    //         firstname: firstname,
    //         lastname: lastname,
    //         address: address,
    //         phone: phone,
    //       ),
    //     ));
  }
}
