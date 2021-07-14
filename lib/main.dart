//Packages
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
//Screens
import "../screens/splash_screen.dart";
import '../screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto Watch',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: SplashScreen(),
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
        });
  }
}
