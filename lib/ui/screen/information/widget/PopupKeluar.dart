// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sketoo/ui/screen/information/widget/CustomButton.dart';
import 'package:sketoo/utils/colors.dart';
import 'package:sketoo/utils/typograhpy.dart';

class PopupKeluar extends StatefulWidget {
  PopupKeluar({super.key, required this.visible});
  bool visible = false;

  @override
  State<PopupKeluar> createState() => _PopupKeluarState();
}

class _PopupKeluarState extends State<PopupKeluar> {
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
                    child: Text('Keluar?', style: textPoppins),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () {
                        setState(() {
                          widget.visible = false;
                        });
                      },
                      color: purple,
                      text: 'Tidak',
                      height: 40,
                      width: 100,
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      onTap: () {
                        SystemNavigator.pop();
                      },
                      color: lightGreen,
                      text: 'Ya',
                      height: 40,
                      width: 100,
                    ),
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
