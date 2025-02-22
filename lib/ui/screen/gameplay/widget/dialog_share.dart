import 'package:flutter/material.dart';
import 'package:sketoo/utils/assets.dart';
import 'package:sketoo/utils/typograhpy.dart';

class DialogShare extends StatelessWidget {
  const DialogShare(
      {super.key, required this.namaHewan, required this.isMenang});
  final String namaHewan;
  final bool isMenang;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          namaHewan == "badak" ? imgBadakResult : imgGajahResult,
          height: 60,
        ),
        const SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(namaHewan == "badak" ? 0xffD4C5FF : 0xffB6E7FF),
            borderRadius: BorderRadius.circular(21),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
              isMenang
                  ? "Kamu menang!"
                  : "Coba lagi ya!",
              style: poppinsBlack18),
        )
      ],
    );
  }
}
