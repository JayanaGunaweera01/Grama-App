import 'package:flutter/material.dart';
import 'package:nutriscan/screens/home_screen.dart';
import 'package:nutriscan/screens/signinup/sign_in_screen.dart';
import 'package:nutriscan/services/colors.dart';
import 'package:nutriscan/widgets/body_widget.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BodyWidget(
          bacgroundImg: 'assets/back/start.jpg',
          isBackBtn: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SigninScreen(),
                    ),
                  );
                },
                padding: const EdgeInsets.all(20),
                minWidth: size.width / 2,
                color: mainColor_1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    color: mainColor_3,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                padding: const EdgeInsets.all(20),
                minWidth: size.width / 2,
                color: mainColor_3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: mainColor_1,
                      style: BorderStyle.solid,
                      width: 1,
                    )),
                child: Text(
                  'Guest User',
                  style: TextStyle(
                    fontSize: 18,
                    color: mainColor_1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
