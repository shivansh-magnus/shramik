import 'package:flutter/material.dart';
import 'package:shramik/components/already_have_an_account_check.dart';
import 'package:shramik/components/rounded_input_field.dart';
import 'package:shramik/components/rounded_password_field.dart';
import 'package:shramik/homepage/homepage.dart';
import 'package:shramik/screen/Signup/sign_up_new.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
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
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
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
                    "LOGIN",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: size.height * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
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
                            return const Homepage();
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
                          return SignUpPage();
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
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
