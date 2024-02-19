import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutriscan/screens/home_screen.dart';
import 'package:nutriscan/screens/signinup/sign_up_screen.dart';
import 'package:nutriscan/services/colors.dart';
import 'package:nutriscan/widgets/body_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BodyWidget(
          bacgroundImg: 'assets/back/signin.jpg',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailTextController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: true,
                expands: false,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  // hintText: 'Enter your email address here',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordTextController,
                obscureText: true,
                expands: false,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  // hintText: 'Enter your password here',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                padding: const EdgeInsets.all(15),
                minWidth: size.width / 2,
                color: mainColor_3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: mainColor_1,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    color: mainColor_1,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      height: 2,
                    ),
                  ),
                  Text('Or sign in with'),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      height: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/google.png',
                  height: 50,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: const Size(200, 40),
                  // primary: Color(0xffb74093),
                  backgroundColor: mainColor_1.withOpacity(0.4),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    color: mainColor_3,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
