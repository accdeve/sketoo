import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sketoo/ui/screen/information/widget/PopupHome.dart';
import 'package:sketoo/ui/screen/information/widget/PopupKeluar.dart';
import 'package:sketoo/utils/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routename = "/home";

  @override
  State<HomeScreen> createState() => __HomeScreen();
}

class __HomeScreen extends State<HomeScreen> {
  bool hasClickPop = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        setState(() {
          hasClickPop = !hasClickPop;
        });
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgBackgroundInformation),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imgLogoAppWithoutText),
                        ),
                      ),
                    ),
                  ).animate().scale(duration: 1500.ms, curve: Curves.bounceOut),
                  const SizedBox(height: 50),
                  const PopupHome().animate().flip(delay: 1500.ms),
                ],
              ),
            ),
            PopupKeluar(visible: hasClickPop)
          ],
        ),
      ),
    );
  }
}
