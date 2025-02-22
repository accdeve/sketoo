// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketoo/cubit/player_1/cubit/player_1_cubit.dart';
import 'package:sketoo/cubit/player_2/cubit/player_2_cubit.dart';
import 'package:sketoo/ui/screen/gameplay/question.dart';
import 'package:sketoo/ui/screen/information/widget/CustomButton.dart';
import 'package:sketoo/ui/screen/information/widget/InputText.dart';
import 'package:sketoo/utils/colors.dart';
import 'package:sketoo/utils/typograhpy.dart';

class PopupInputPlayer extends StatelessWidget {
  const PopupInputPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 280,
            height: 300,
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
                    color: Color.fromARGB(255, 232, 226, 237),
                    offset: Offset(-1.5, -2)),
              ],
            ),
            child: Center(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text('Player', style: textPoppins),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 9,
            child: Container(
              width: 260,
              height: 235,
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: white,
                      offset: const Offset(1, 1.5))
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputText(
                      hintText: "Nama Player 1",
                      backgroundColor: white,
                      width: 200,
                      height: 40,
                      onChanged: (value) {
                        if (value == "") {
                          context.read<Player_1Cubit>().changeName("Player 1");
                        } else {
                          context.read<Player_1Cubit>().changeName(value);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    InputText(
                      hintText: "Nama Player 2",
                      backgroundColor: white,
                      width: 200,
                      height: 40,
                      onChanged: (value) {
                        if (value == "") {
                          context.read<Player_2Cubit>().changeName("Player 2");
                        } else {
                          context.read<Player_2Cubit>().changeName(value);
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacementNamed(
                              context, QuestionScreen.routename);
                        },
                        color: purple,
                        text: 'Start!',
                        height: 45,
                        width: 135),
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
