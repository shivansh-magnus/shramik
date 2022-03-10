import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shramik/components/already_have_an_account_check.dart';
import 'package:shramik/components/rounded_input_field.dart';
import 'package:shramik/components/rounded_password_field.dart';
import 'package:shramik/screen/Login/login_screen_new.dart';
import 'package:shramik/screen/Signup/signup_form.dart';

import 'components/or_divider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
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
        body: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            width: double.infinity,
            child: Column(children: [
              SizedBox(
                height: topPadding,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              AnimatedImage(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "SIGN UP",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: size.height * 0.03,
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
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
                        return const SignUpForm();
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
              SizedBox(
                height: size.height * 0.04,
              ),
              AlreadyHaveAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 3,
    ),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation =
      Tween(begin: const Offset(0, 0), end: const Offset(0, 0.08)).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new Image.asset("assets/clouds.png"),
        SlideTransition(
          position: _animation,
          child: new Image.asset("assets/rocket_person.png"),
        ),
      ],
    );
  }
}
