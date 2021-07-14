//Packages
import "package:flutter/material.dart";
//Constants
import '../constants/constants.dart';

//Screens
import "../screens/home_screen.dart";

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacementNamed(context, HomeScreen.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CRYPTO',
              style: splashText1,
            ),
            Text(
              'BASE',
              style: splashText2,
            ),
          ],
        ),
      ),
    );
  }
}
