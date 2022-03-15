import 'package:flutter/material.dart';

import '../homepage_em.dart';

class JobForm extends StatefulWidget {
  const JobForm({Key? key}) : super(key: key);

  @override
  _JobFormState createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  String? _JobTitle;
  String? _Description;
  int? _phoneNumber;
  String? _location;
  String? _skills;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildJobTitle() {
    FocusNode myFocusNode = new FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Job Title',
        hintText: 'Enter your job title',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'JobTitle is required';
        }
      },
      onSaved: (String? value) {
        _JobTitle != value;
      },
    );
  }

  Widget _buildDescription() {
    FocusNode myFocusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: 'Enter description of the job',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      maxLength: 200,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Description is required';
        }
      },
      onSaved: (String? value) {
        _Description != value;
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

  Widget _buildLocation() {
    FocusNode myFocusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Location',
        hintText: 'Enter location of the job',
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.blue : Colors.black,
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Location is required';
        }
      },
      onSaved: (String? value) {
        _location != value;
      },
    );
  }

  Widget _buildskills() {
    FocusNode myFocusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Skills Required',
        hintText: 'Enter Skills required for the job',
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
        _skills != value;
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
          title: const Text('ADD JOB'),
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
                  _buildJobTitle(),
                  SizedBox(height: size.height * 0.04),
                  _buildDescription(),
                  SizedBox(height: size.height * 0.04),
                  _buildphoneNumber(),
                  SizedBox(height: size.height * 0.04),
                  _buildLocation(),
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
                          "ADD",
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
