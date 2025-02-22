// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sketoo/cubit/player_1/cubit/player_1_cubit.dart';
import 'package:sketoo/cubit/player_2/cubit/player_2_cubit.dart';
import 'package:sketoo/ui/screen/gameplay/question.dart';
import 'package:sketoo/ui/screen/information/welcome.dart';
import 'package:sketoo/utils/assets.dart';
import 'package:sketoo/utils/colors.dart';
import 'package:sketoo/utils/typograhpy.dart';

class PopupPause extends StatefulWidget {
  PopupPause({super.key, required this.visible, required this.onPlayPausePressed});
  bool visible = false;
  final VoidCallback onPlayPausePressed;

  @override
  State<PopupPause> createState() => _PopupPauseState();
}

class _PopupPauseState extends State<PopupPause> {
  Future<void> clearCache() async {
    try {
      Directory cacheDir = await getTemporaryDirectory();
      List<FileSystemEntity> fileList = cacheDir.listSync();
      for (FileSystemEntity file in fileList) {
        if (file is File) {
          file.deleteSync();
        }
      }
      cacheDir.deleteSync(recursive: true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xFF3C273F).withOpacity(0.1), width: 3),
                gradient: LinearGradient(
                  colors: [lightBlue, const Color(0xFFE2D6ED)],
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
                    child: Text('Pause', style: textPoppins),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 9,
              child: Container(
                width: 300,
                height: 135,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, QuestionScreen.routename);
                          context.read<Player_1Cubit>().reset();
                          context.read<Player_2Cubit>().reset();
                          clearCache();
                        },
                        child: Image.asset(logoRetryPause)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            widget.visible = false;
                          });
                           widget.onPlayPausePressed();
                        },
                        child: Image.asset(logoPlayPause)),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routename);
                          context.read<Player_1Cubit>().reset();
                          context.read<Player_2Cubit>().reset();
                          clearCache();
                        },
                        child: Image.asset(logoHomePause)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
