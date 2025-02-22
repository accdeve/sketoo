import 'package:flutter/material.dart';
import 'package:sketoo/utils/colors.dart';
import 'package:sketoo/utils/typograhpy.dart'; // Import widget HargaHewan

class PopUpPemenang extends StatelessWidget {
  final String namaGambar;
  final bool isPemenang;

  const PopUpPemenang({
    super.key,
    required this.namaGambar,
    required this.isPemenang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 10, color: lightBlue),
      ),
      child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: yellow,
            border: Border.all(
              color: yellow, // Warna kuning
              width: 10, // Ketebalan border
            ),
            borderRadius: BorderRadius.circular(18), // Radius 18
          ),
          child: Column(
            children: [
              Image.asset("assets/gameplay/$namaGambar", height: 100),
              Text(
                isPemenang
                    ? "Selamat, kamu memenangkan permainan!"
                    : "Monster menang, Usahamu bagus, Coba lagi ya!",
                style: poppinsBlack16,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
