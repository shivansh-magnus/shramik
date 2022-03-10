import 'package:flutter/material.dart';
import 'package:shramik/homepage/homepage.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? _firstName;
  String? _lastName;
  int? _phoneNumber;
  String? _occupation;
  // String _skills;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildfirstName() {
    FocusNode myFocusNode = new FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'FirstName is required';
        }
      },
      onSaved: (String? value) {
        _firstName != value;
      },
    );
  }

  Widget _buildlastName() {
    FocusNode myFocusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your Last name',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'LastName is required';
        }
      },
      onSaved: (String? value) {
        _lastName != value;
      },
    );
  }

  Widget _buildphoneNumber() {
    FocusNode myFocusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        hintText: 'Enter your Phone number',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
        RegExp regExp = new RegExp(patttern);
        if (value!.isEmpty) {
          return 'Phone number is required';
        } else {
          if (value.length == 0) {
            return 'Please enter mobile number';
          } else if (!regExp.hasMatch(value)) {
            return 'Please enter valid mobile number';
          }
          return null;
        }
      },
      onSaved: (String? value) {
        _phoneNumber != value;
      },
    );
  }

  Widget _buildoccupation() {
    FocusNode myFocusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Occupation',
        hintText: 'Enter your Occupation',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Occupation is required';
        }
      },
      onSaved: (String? value) {
        _occupation != value;
      },
    );
  }

  Widget _buildskills() {
    FocusNode myFocusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Skills',
        hintText: 'Enter your Skills',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Skills is required';
        }
      },
      onSaved: (String? value) {
        _occupation != value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(145, 131, 222, 1),
            Color.fromRGBO(160, 148, 227, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Sign Up'),
        ),
        body: Container(
          margin: EdgeInsets.all(
            size.height * 0.04,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildfirstName(),
                  SizedBox(height: size.height * 0.04),
                  _buildlastName(),
                  SizedBox(height: size.height * 0.04),
                  _buildphoneNumber(),
                  SizedBox(height: size.height * 0.04),
                  _buildoccupation(),
                  SizedBox(height: size.height * 0.04),
                  _buildskills(),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: size.width * 0.8,
                      child: TextButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Homepage();
                          }));
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          primary: Colors.black,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
