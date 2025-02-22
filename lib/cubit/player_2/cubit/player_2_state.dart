// ignore_for_file: camel_case_types

part of 'player_2_cubit.dart';

class Player_2State extends Equatable{
  final int koin;
  final int babak;
  final bool hasClick;
  final String nama;
  final List<String> pasukanHewan;
  final List<String> pathImages;

  const Player_2State(
      {this.koin = 0,
      this.nama = "Player2",
      this.pasukanHewan = const [],
      this.babak = 0,
      this.hasClick = false,
      this.pathImages = const []});

  @override
  List<Object?> get props => [koin, pasukanHewan, babak, hasClick, nama, pathImages];
}

final class Player_2Initial extends Player_2State {}
