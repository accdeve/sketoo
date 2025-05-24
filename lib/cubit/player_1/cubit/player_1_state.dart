// ignore_for_file: camel_case_types

part of 'player_1_cubit.dart';

// class Player_1State extends Equatable {
//   final int koin;
//   final int babak;
//   final bool hasClick;
//   final String nama;
//   final List<String> pasukanHewan;
//   final List<String> pathImages;

//   const Player_1State(
//       {this.koin = 0,
//       this.nama = "Player 1",
//       this.pasukanHewan = const [],
//       this.babak = 0,
//       this.hasClick = false,
//       this.pathImages = const[]});

//   @override
//   List<Object?> get props => [koin, pasukanHewan, babak, hasClick, nama, pathImages];
// }

// final class Player_1Initial extends Player_1State {}

class Player_1State extends Equatable {
  final Player player_1;

  Player_1State({
    Player? player_1,
  }) : player_1 = player_1 ??
            Player(
              koin: 0,
              nama: "Player 1",
              pasukanHewan: [],
              babak: 0,
              hasClick: false,
              pathImages: [],
            );

  Player_1State copyWith({
    Player? player_1,
  }) {
    return Player_1State(
      player_1: player_1 ?? this.player_1,
    );
  }

  @override
  List<Object?> get props => [player_1]; 
}

final class Player_1Initial extends Player_1State {}
