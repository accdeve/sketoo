import 'package:flutter/material.dart';
import 'package:sketoo/ui/screen/information/welcome.dart';
import 'package:sketoo/utils/assets.dart';
import 'package:sketoo/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  static const routename = "/splash_screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routename);
    });

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: lightGreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Image.asset(imgLogoApp),
            ),
          ],
        ),
      ),
    );
  }
}
