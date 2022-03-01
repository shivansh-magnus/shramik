import 'package:flutter/material.dart';
import 'package:shramik/components/already_have_an_account_check.dart';
import 'package:shramik/components/rounded_input_field.dart';
import 'package:shramik/components/rounded_password_field.dart';
import 'package:shramik/homepage/homepage.dart';
import 'package:shramik/screen/Signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: size.height * 0.03,
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: size.width * 0.8,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Homepage();
                    }));
                  },
                  child: const Text(
                    "LOGIN",
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
            SizedBox(
              height: size.height * 0.02,
            ),
            AlreadyHaveAccountCheck(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            }),
          ],
        )),
      ),
    );
  }
}
