import 'package:flutter/material.dart';
import 'package:shramik/components/already_have_an_account_check.dart';
import 'package:shramik/components/rounded_input_field.dart';
import 'package:shramik/components/rounded_password_field.dart';
import 'package:shramik/components/text_field_container.dart';
import 'package:shramik/screen/Login/login_screen.dart';
import 'components/or_divider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              "SIGN UP",
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
                  onPressed: () {},
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
            SizedBox(
              height: size.height * 0.04,
            ),
            AlreadyHaveAccountCheck(
                login: false,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            const OrDivider(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(00),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.black54,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/facebook.svg',
                      height: 60,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.black54,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/twitter.svg',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.black54,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/google_plus.svg',
                      height: 50,
                      width: 50,
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
