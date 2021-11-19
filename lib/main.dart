
import 'package:clone/android/signup/signup_page.dart';
import 'package:clone/linux/signup/signup_page.dart';
import 'package:clone/logic/database/database_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clone/android/signup/signup_page.dart' as android_signup;
import 'package:clone/linux/signup/signup_page.dart' as linux_signup;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DatabaseBloc()..add(CreateDatabase()),
    child: const CloneApp(),
  ));
}

class CloneApp extends StatelessWidget {
  const CloneApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
        if (settings.name == 'sign_in') {
          return MaterialPageRoute(
              builder: (_) => const android_signup.SignUp());
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildBlocListener(),
      ),
    );
  }

  BlocListener<DatabaseBloc, DatabaseState> buildBlocListener() {
    return BlocListener<DatabaseBloc, DatabaseState>(
        listener: (context, state) {
          if (state is FirstTime) {
            Navigator.of(context).pushNamed('sign_in');
          }
        },
        child: Center(
          child: Text("Splash Screen",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: MediaQuery.textScaleFactorOf(context) * 30)),
        ));
  }
}

Widget errorPage() {
  return Scaffold(
      body: Center(
    child: Column(
      children: const [
        Text("Sorry, An Eternal Error Has Occurred; try relaunching the app. ")
      ],
    ),
  ));
}
