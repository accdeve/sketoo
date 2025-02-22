// ignore_for_file: camel_case_types

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_1_state.dart';

class Player_1Cubit extends Cubit<Player_1State> {
  Player_1Cubit() : super(Player_1Initial());

  void addPasukanHewan(String hewan) {
    List<String> updatedPasukanHewan = List.from(state.pasukanHewan)
      ..add(hewan);
    int jumlahKoin = state.koin;
    List<String> updatedPathImages = state.pathImages;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_1State(
        pasukanHewan: updatedPasukanHewan,
        pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        babak: babak,
        hasClick: hasClick));
  }

  void addPathImages(String path) {
    List<String> updatedPathImages = List.from(state.pathImages)..add(path);
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int jumlahKoin = state.koin;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_1State(
        pasukanHewan: updatedPasukanHewan,
        nama: nama,
        koin: jumlahKoin,
        babak: babak,
        hasClick: hasClick,
        pathImages: updatedPathImages));
  }

  void changeName(String nama) {
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    List<String> updatedPathImages = state.pathImages;
    emit(Player_1State(
        pathImages: updatedPathImages,
        babak: babak,
        hasClick: hasClick,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        nama: nama));
  }

  void reset() {
    emit(const Player_1State(
        pathImages: [],
        babak: 0,
        pasukanHewan: [],
        koin: 0,
        hasClick: false,
        nama: "Player 1"));
  }

  void addKoinValue(int amount) {
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_1State(
        pathImages: updatedPathImages,
        koin: jumlahKoin + amount,
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: hasClick));
  }

  void subtractionKoin(int amount) {
    int jumlahKoin = state.koin;
    List<String> updatedPathImages = state.pathImages;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_1State(
        pathImages: updatedPathImages,
        koin: jumlahKoin - amount,
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: hasClick));
  }

  void addBabak() {
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_1State(
        pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        babak: babak + 1,
        hasClick: hasClick));
  }

  void changeTrueClick() {
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    String nama = state.nama;
    emit(Player_1State(
        pathImages: updatedPathImages,
        koin: jumlahKoin,
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: true));
  }

  void changeFalseClick() {
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    String nama = state.nama;
    emit(Player_1State(
        pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: false));
  }
}
