// ignore_for_file: camel_case_types

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sketoo/model/player.dart';
part 'player_2_state.dart';

class Player_2Cubit extends Cubit<Player_2State> {
  Player_2Cubit() : super(Player_2Initial());

  void addPasukanHewan(String hewan) {
    List<String> updatedPasukanHewan = List.from(state.player_2.pasukanHewan)
      ..add(hewan);
    List<String> updatedPathImages = state.player_2.pathImages;
    int jumlahKoin = state.player_2.koin;
    int babak = state.player_2.babak;
    bool hasClick = state.player_2.hasClick;
    String nama = state.player_2.nama;
    emit(Player_2State(
      player_2: Player(
          pathImages: updatedPathImages,
          nama: nama,
          pasukanHewan: updatedPasukanHewan,
          koin: jumlahKoin,
          babak: babak,
          hasClick: hasClick),
    ));
  }

  void addPathImages(String path) {
    List<String> updatedPathImages = List.from(state.player_2.pathImages)
      ..add(path);
    List<String> updatedPasukanHewan = state.player_2.pasukanHewan;
    int jumlahKoin = state.player_2.koin;
    int babak = state.player_2.babak;
    bool hasClick = state.player_2.hasClick;
    String nama = state.player_2.nama;
    emit(Player_2State(
      player_2: Player(
          nama: nama,
          pasukanHewan: updatedPasukanHewan,
          koin: jumlahKoin,
          babak: babak,
          hasClick: hasClick,
          pathImages: updatedPathImages),
    ));
  }

  void changeName(String nama) {
    List<String> updatedPathImages = state.player_2.pathImages;
    int jumlahKoin = state.player_2.koin;
    List<String> updatedPasukanHewan = state.player_2.pasukanHewan;
    int babak = state.player_2.babak;
    bool hasClick = state.player_2.hasClick;
    emit(Player_2State(
      player_2: Player(
          pathImages: updatedPathImages,
          babak: babak,
          hasClick: hasClick,
          koin: jumlahKoin,
          pasukanHewan: updatedPasukanHewan,
          nama: nama),
    ));
  }

  void reset() {
    emit(Player_2State(
      player_2: Player(
          pathImages: [],
          babak: 0,
          pasukanHewan: [],
          koin: 0,
          hasClick: false,
          nama: "Player 2"),
    ));
  }

  void addKoinValue(int amount) {
    List<String> updatedPathImages = state.player_2.pathImages;
    int jumlahKoin = state.player_2.koin;
    List<String> updatedPasukanHewan = state.player_2.pasukanHewan;
    int babak = state.player_2.babak;
    bool hasClick = state.player_2.hasClick;
    String nama = state.player_2.nama;
    emit(Player_2State(
      player_2: Player( pathImages: updatedPathImages,
        koin: jumlahKoin + amount,
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: hasClick),
       ));
  }

  void subtractionKoin(int amount) {
    List<String> updatedPathImages = state.player_2.pathImages;
    int jumlahKoin = state.player_2.koin;
    List<String> updatedPasukanHewan = state.player_2.pasukanHewan;
    int babak = state.player_2.babak;
    bool hasClick = state.player_2.hasClick;
    String nama = state.player_2.nama;
    emit(Player_2State(
      player_2: Player( pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin - amount,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: hasClick),
       ));
  }

  void addBabak() {
    int jumlahKoin = state.player_2.koin;
    List<String> updatedPathImages = state.player_2.pathImages;
    List<String> updatedPasukanHewan = state.player_2.pasukanHewan;
    int babak = state.player_2.babak;
    bool hasClick = state.player_2.hasClick;
    String nama = state.player_2.nama;
    emit(Player_2State(
      player_2: Player( pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        babak: babak + 1,
        hasClick: hasClick),
       ));
  }

  void changeTrueClick() {
    List<String> updatedPathImages = state.player_2.pathImages;
    int jumlahKoin = state.player_2.koin;
    List<String> updatedPasukanHewan = state.player_2.pasukanHewan;
    int babak = state.player_2.babak;
    String nama = state.player_2.nama;
    emit(Player_2State(
      player_2: Player( pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: true),
       ));
  }

  void changeFalseClick() {
    List<String> updatedPathImages = state.player_2.pathImages;
    int jumlahKoin = state.player_2.koin;
    List<String> updatedPasukanHewan = state.player_2.pasukanHewan;
    int babak = state.player_2.babak;
    String nama = state.player_2.nama;
    emit(Player_2State(
      player_2: Player(pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: false),
        ));
  }
}
