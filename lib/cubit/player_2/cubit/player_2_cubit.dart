// ignore_for_file: camel_case_types

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'player_2_state.dart';

class Player_2Cubit extends Cubit<Player_2State> {
  Player_2Cubit() : super(Player_2Initial());

  void addPasukanHewan(String hewan) {
    List<String> updatedPasukanHewan = List.from(state.pasukanHewan)
      ..add(hewan);
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_2State(
        pathImages: updatedPathImages,
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
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
    emit(Player_2State(
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
        koin: jumlahKoin,
        babak: babak,
        hasClick: hasClick,
        pathImages: updatedPathImages));
  }

  void changeName(String nama) {
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    emit(Player_2State(
        pathImages: updatedPathImages,
        babak: babak,
        hasClick: hasClick,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        nama: nama));
  }

  void reset() {
    emit(const Player_2State(
        pathImages: [],
        babak: 0,
        pasukanHewan: [],
        koin: 0,
        hasClick: false,
        nama: "Player 2"));
  }

  void addKoinValue(int amount) {
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_2State(
        pathImages: updatedPathImages,
        koin: jumlahKoin + amount,
        nama: nama,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: hasClick));
  }

  void subtractionKoin(int amount) {
    List<String> updatedPathImages = state.pathImages;
    int jumlahKoin = state.koin;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_2State(
        pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin - amount,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: hasClick));
  }

  void addBabak() {
    int jumlahKoin = state.koin;
    List<String> updatedPathImages = state.pathImages;
    List<String> updatedPasukanHewan = state.pasukanHewan;
    int babak = state.babak;
    bool hasClick = state.hasClick;
    String nama = state.nama;
    emit(Player_2State(
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
    emit(Player_2State(
        pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
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
    emit(Player_2State(
        pathImages: updatedPathImages,
        nama: nama,
        koin: jumlahKoin,
        pasukanHewan: updatedPasukanHewan,
        babak: babak,
        hasClick: false));
  }
}
