import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sketoo/cubit/player_1/cubit/player_1_cubit.dart';
import 'package:sketoo/cubit/player_2/cubit/player_2_cubit.dart';
import 'package:sketoo/ui/screen/gameplay/widget/scores_conclusion.dart';
import 'package:sketoo/ui/screen/information/welcome.dart';
import 'package:sketoo/ui/screen/information/widget/PopupKeluar.dart';
import 'package:sketoo/utils/assets.dart';

class Conclusion extends StatefulWidget {
  static const routename = "/conclusion";
  const Conclusion({super.key});

  @override
  State<Conclusion> createState() => _ConclusionState();
}

class _ConclusionState extends State<Conclusion> {
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
            Positioned.fill(
              child: Image.asset(
                imgBackgroundInformation,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgLogoAppWithoutText),
                      ),
                    ),
                  ).animate().scale(duration: 1500.ms, curve: Curves.bounceOut),
                  const SizedBox(height: 60),
                  const ScoreConclusion().animate().flip(delay: 1500.ms)
                ],
              ),
            ),
            PopupKeluar(visible: hasClickPop)
          ],
        ),
        floatingActionButton: InkWell(
            onTap: () {
              context.read<Player_1Cubit>().reset();
              context.read<Player_2Cubit>().reset();
              Navigator.pushReplacementNamed(context, HomeScreen.routename);
              clearCache();
            },
            child: Image.asset(imgHomeButton)),
      ),
    );
  }
}
