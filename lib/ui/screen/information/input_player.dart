import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sketoo/ui/screen/information/widget/PopupInputPlayer.dart';
import 'package:sketoo/utils/assets.dart';

class InputPlayer extends StatefulWidget {
  const InputPlayer({super.key});
  static const routename = "/player-information";

  @override
  State<InputPlayer> createState() => _InputPlayerState();
}

class _InputPlayerState extends State<InputPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgBackgroundInformation),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                    image: AssetImage(imgLogoApp),
                  ),
                ),
              )),
              const SizedBox(height: 20),
              const PopupInputPlayer().animate().fadeIn(
                  delay: 300.ms, duration: 500.ms, curve: Curves.easeIn),
            ],
          ),
        ),
      ),
    );
  }
}
