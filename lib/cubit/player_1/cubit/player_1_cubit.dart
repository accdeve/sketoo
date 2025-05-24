// ignore_for_file: camel_case_types

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sketoo/model/player.dart';

part 'player_1_state.dart';

class Player_1Cubit extends Cubit<Player_1State> {
  Player_1Cubit() : super(Player_1Initial());

  void addPasukanHewan(String hewan) {
    List<String> updatedPasukanHewan = List.from(state.player_1.pasukanHewan)
      ..add(hewan);
    int jumlahKoin = state.player_1.koin;
    List<String> updatedPathImages = state.player_1.pathImages;
    int babak = state.player_1.babak;
    bool hasClick = state.player_1.hasClick;
    String nama = state.player_1.nama;
    emit(Player_1State(
        player_1: Player(
            pasukanHewan: updatedPasukanHewan,
            pathImages: updatedPathImages,
            nama: nama,
            koin: jumlahKoin,
            babak: babak,
            hasClick: hasClick)));
  }

  void addPathImages(String path) {
    List<String> updatedPathImages = List.from(state.player_1.pathImages)
      ..add(path);
    List<String> updatedPasukanHewan = state.player_1.pasukanHewan;
    int jumlahKoin = state.player_1.koin;
    int babak = state.player_1.babak;
    bool hasClick = state.player_1.hasClick;
    String nama = state.player_1.nama;
    emit(Player_1State(
      player_1: Player(
          pasukanHewan: updatedPasukanHewan,
          nama: nama,
          koin: jumlahKoin,
          babak: babak,
          hasClick: hasClick,
          pathImages: updatedPathImages),
    ));
  }

  void changeName(String nama) {
    int jumlahKoin = state.player_1.koin;
    List<String> updatedPasukanHewan = state.player_1.pasukanHewan;
    int babak = state.player_1.babak;
    bool hasClick = state.player_1.hasClick;
    List<String> updatedPathImages = state.player_1.pathImages;
    emit(Player_1State(
      player_1: Player(
          pathImages: updatedPathImages,
          babak: babak,
          hasClick: hasClick,
          koin: jumlahKoin,
          pasukanHewan: updatedPasukanHewan,
          nama: nama),
    ));
  }

  void reset() {
    emit(Player_1State(
      player_1: Player(
          pathImages: [],
          babak: 0,
          pasukanHewan: [],
          koin: 0,
          hasClick: false,
          nama: "Player 1"),
    ));
  }

  void addKoinValue(int amount) {
    List<String> updatedPathImages = state.player_1.pathImages;
    int jumlahKoin = state.player_1.koin;
    List<String> updatedPasukanHewan = state.player_1.pasukanHewan;
    int babak = state.player_1.babak;
    bool hasClick = state.player_1.hasClick;
    String nama = state.player_1.nama;
    emit(Player_1State(
      player_1: Player(
          pathImages: updatedPathImages,
          koin: jumlahKoin + amount,
          nama: nama,
          pasukanHewan: updatedPasukanHewan,
          babak: babak,
          hasClick: hasClick),
    ));
  }

  void subtractionKoin(int amount) {
    int jumlahKoin = state.player_1.koin;
    List<String> updatedPathImages = state.player_1.pathImages;
    List<String> updatedPasukanHewan = state.player_1.pasukanHewan;
    int babak = state.player_1.babak;
    bool hasClick = state.player_1.hasClick;
    String nama = state.player_1.nama;
    emit(Player_1State(
      player_1: Player(
          pathImages: updatedPathImages,
          koin: jumlahKoin - amount,
          nama: nama,
          pasukanHewan: updatedPasukanHewan,
          babak: babak,
          hasClick: hasClick),
    ));
  }

  void addBabak() {
    List<String> updatedPathImages = state.player_1.pathImages;
    int jumlahKoin = state.player_1.koin;
    List<String> updatedPasukanHewan = state.player_1.pasukanHewan;
    int babak = state.player_1.babak;
    bool hasClick = state.player_1.hasClick;
    String nama = state.player_1.nama;
    emit(Player_1State(
      player_1: Player(
          pathImages: updatedPathImages,
          nama: nama,
          koin: jumlahKoin,
          pasukanHewan: updatedPasukanHewan,
          babak: babak + 1,
          hasClick: hasClick),
    ));
  }

  void changeTrueClick() {
    List<String> updatedPathImages = state.player_1.pathImages;
    int jumlahKoin = state.player_1.koin;
    List<String> updatedPasukanHewan = state.player_1.pasukanHewan;
    int babak = state.player_1.babak;
    String nama = state.player_1.nama;
    emit(Player_1State(
      player_1: Player( pathImages: updatedPathImages,
        koin: jumlahKoin,
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: true),
       ));
  }

  void changeFalseClick() {
    List<String> updatedPathImages = state.player_1.pathImages;
    int jumlahKoin = state.player_1.koin;
    List<String> updatedPasukanHewan = state.player_1.pasukanHewan;
    int babak = state.player_1.babak;
    String nama = state.player_1.nama;
    emit(Player_1State(
      player_1: Player( pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: false),
       ));
  }
}
