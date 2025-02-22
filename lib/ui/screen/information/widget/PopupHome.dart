// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sketoo/ui/screen/information/input_player.dart';
import 'package:sketoo/ui/screen/information/widget/CustomButton.dart';
import 'package:sketoo/utils/colors.dart';
import 'package:sketoo/utils/typograhpy.dart';

class PopupHome extends StatelessWidget {
  const PopupHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 320,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xFF3C273F).withOpacity(0.1), width: 3),
              gradient: LinearGradient(
                colors: [lightBlue, lightBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 15,
                    blurStyle: BlurStyle.outer,
                    color: Color(0xFF767676)),
                BoxShadow(
                    blurStyle: BlurStyle.inner,
                    color: Color(0xFFE8E2ED),
                    offset: Offset(-1.5, -2)),
              ],
            ),
            child: Center(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text('Welcome,', style: textPoppins),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 9,
            child: Container(
              width: 300,
              height: 130,
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.white,
                      offset: Offset(1, 1.5))
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context, InputPlayer.routename);
                        },
                        color: const Color(0xFFB1AFFF),
                        text: 'Play',
                        height: 50,
                        width: 120)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
