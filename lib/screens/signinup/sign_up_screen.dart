import 'package:flutter/material.dart';
import 'package:nutriscan/screens/home_screen.dart';
import 'package:nutriscan/services/colors.dart';
import 'package:nutriscan/widgets/body_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();
  TextEditingController heightTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();
  TextEditingController bodyFatTextController = TextEditingController();
  TextEditingController bloodSugarTextController = TextEditingController();
  TextEditingController lipidTextController = TextEditingController();
  TextEditingController activityLevelTextController = TextEditingController();
  TextEditingController allergiesLevelTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BodyWidget(
          bacgroundImg: 'assets/back/reg.jpg',
          backBtnRight: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: userNameTextController,
                autocorrect: true,
                expands: false,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.email),
                  // hintText: 'Enter your email address here',
                  labelText: 'User Name',
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
                  // icon: Icon(Icons.lock),
                  // hintText: 'Enter your password here',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width / 2 - 25,
                    child: TextFormField(
                      controller: ageTextController,
                      autocorrect: true,
                      expands: false,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.person),
                        labelText: 'Age',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: size.width / 2 - 25,
                    child: TextFormField(
                      controller: genderTextController,
                      autocorrect: true,
                      expands: false,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.person),
                        labelText: 'Gender',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width / 2 - 25,
                    child: TextFormField(
                      controller: heightTextController,
                      autocorrect: true,
                      expands: false,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.person),
                        labelText: 'Height',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: size.width / 2 - 25,
                    child: TextFormField(
                      controller: weightTextController,
                      autocorrect: true,
                      expands: false,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.person),
                        labelText: 'Weight',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: bodyFatTextController,
                obscureText: true,
                expands: false,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.lock),
                  // hintText: 'Enter your password here',
                  labelText: 'Body Fat',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: bloodSugarTextController,
                obscureText: true,
                expands: false,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.lock),
                  // hintText: 'Enter your password here',
                  labelText: 'Fasting Blood Sugar',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: lipidTextController,
                obscureText: true,
                expands: false,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.lock),
                  // hintText: 'Enter your password here',
                  labelText: 'Lipid Profile',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: activityLevelTextController,
                obscureText: true,
                expands: false,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.lock),
                  // hintText: 'Enter your password here',
                  labelText: 'Physical Activity Level',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: allergiesLevelTextController,
                obscureText: true,
                expands: false,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.lock),
                  // hintText: 'Enter your password here',
                  labelText: 'Allergies',
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
                    )),
                child: Text(
                  'Continue >>',
                  style: TextStyle(
                    fontSize: 18,
                    color: mainColor_1,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
