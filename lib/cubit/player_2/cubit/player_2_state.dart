// ignore_for_file: camel_case_types

part of 'player_2_cubit.dart';

class Player_2State extends Equatable{
  final Player player_2;

  Player_2State({
    Player? player_2,
  }) : player_2 = player_2 ??
            Player(
              koin: 0,
              nama: "Player 2",
              pasukanHewan: [],
              babak: 0,
              hasClick: false,
              pathImages: [],
            );

  Player_2State copyWith({
    Player? player_2,
  }) {
    return Player_2State(
      player_2: player_2 ?? this.player_2,
    );
  }

  @override
  List<Object?> get props => [player_2]; 
}

final class Player_2Initial extends Player_2State {}
