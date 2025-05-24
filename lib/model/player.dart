class Player{
  final int koin;
  final int babak;
  final bool hasClick;
  final String nama;
  final List<String> pasukanHewan;
  final List<String> pathImages;

  Player({
    required this.koin,
    required this.babak,
    required this.hasClick,
    required this.nama,
    required this.pasukanHewan,
    required this.pathImages,
  });
}