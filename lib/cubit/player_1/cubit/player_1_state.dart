// ignore_for_file: camel_case_types

part of 'player_1_cubit.dart';

class Player_1State extends Equatable {
  final int koin;
  final int babak;
  final bool hasClick;
  final String nama;
  final List<String> pasukanHewan;
  final List<String> pathImages;

  const Player_1State(
      {this.koin = 0,
      this.nama = "Player 1",
      this.pasukanHewan = const [],
      this.babak = 0,
      this.hasClick = false,
      this.pathImages = const[]});

  @override
  List<Object?> get props => [koin, pasukanHewan, babak, hasClick, nama, pathImages];
}

final class Player_1Initial extends Player_1State {}
