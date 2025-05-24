import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketoo/cubit/player_1/cubit/player_1_cubit.dart';
import 'package:sketoo/cubit/player_2/cubit/player_2_cubit.dart';
import 'package:sketoo/ui/screen/gameplay/question.dart';
import 'package:sketoo/ui/screen/gameplay/result.dart';
import 'package:sketoo/ui/screen/gameplay/widget/animal_price.dart';
import 'package:sketoo/ui/screen/gameplay/widget/pop_up_pause.dart';
import 'package:sketoo/utils/assets.dart';
import 'package:sketoo/utils/colors.dart';
import 'package:sketoo/utils/typograhpy.dart';

class BuyAnimal extends StatefulWidget {
  static const routename = "/buy_animal";
  const BuyAnimal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuyAnimalState createState() => _BuyAnimalState();
}

class _BuyAnimalState extends State<BuyAnimal> {
  bool hasClickPop = false;
  // button for player 1
  bool isRabbit1Choosen = true;
  bool isMonkey1Choosen = true;
  bool isElephant1Choosen = true;
  bool isSkip1Choosen = true;

  // button for player 2
  bool isRabbit2Choosen = true;
  bool isMonkey2Choosen = true;
  bool isRhino2Choosen = true;
  bool isSkip2Choosen = true;

  // acak angka

  List pasukanMonster = ["monster_besar"];

  @override
  void initState() {
    super.initState();
    context.read<Player_2Cubit>().addPasukanHewan(pasukanMonster[0]);
  }

  // logic
  void logicGamePlay(int player, int hargaHewan, String namaGambar, bool skip) {
    bool player1Click = context.read<Player_1Cubit>().state.player_1.hasClick;
    bool player2Click = context.read<Player_2Cubit>().state.player_2.hasClick;
    int playerBabak = context.read<Player_1Cubit>().state.player_1.babak;

    if (player == 1 && !player1Click) {
      context.read<Player_1Cubit>().subtractionKoin(hargaHewan);
      context.read<Player_1Cubit>().changeTrueClick();
      if (!skip) {
        context.read<Player_1Cubit>().addPasukanHewan(namaGambar);
      }
    }
    if (player == 2 && !player2Click) {
      context.read<Player_2Cubit>().subtractionKoin(hargaHewan);
      context.read<Player_2Cubit>().changeTrueClick();
      if (!skip) {
        context.read<Player_1Cubit>().addPasukanHewan(namaGambar);
      }
    }

    if (player1Click || player2Click) {
      try {
        if (playerBabak < 4) {
          Navigator.pushReplacementNamed(context, QuestionScreen.routename);
        } else {
          Navigator.pushReplacementNamed(context, Result.routename);
        }
      } catch (e) {
        throw ("error le $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    int koinPlayer1 = context.read<Player_1Cubit>().state.player_1.koin;
    int koinPlayer2 = context.read<Player_2Cubit>().state.player_2.koin;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: lightGreen,
        body: screenHeight < 750
            ? SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imgBackgroundInformation), fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 30),
                            //player 2
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: Image.asset(iconHapus),
                                ),
                                BlocBuilder<Player_2Cubit, Player_2State>(
                                  builder: (context, state) {
                                    return RotatedBox(
                                      quarterTurns: 2,
                                      child: Row(
                                        children: [
                                          Image.asset(iconKoin),
                                          Text("${state.player_2.koin}", style: jomhuriaBlack20),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            RotatedBox(
                                quarterTurns: 2,
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 10, color: lightBlue),
                                        ),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: yellow,
                                              border: Border.all(
                                                color: yellow,
                                                width: 10,
                                              ),
                                              borderRadius: BorderRadius.circular(18),
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Visibility(
                                                      visible: isRabbit2Choosen,
                                                      child: InkWell(
                                                        onTap: () {
                                                          if (koinPlayer2 > 29) {
                                                            setState(() {
                                                              isMonkey2Choosen = false;
                                                              isRhino2Choosen = false;
                                                              isSkip2Choosen = false;
                                                            });
                                                            logicGamePlay(2, 30, "kelinci", false);
                                                          }
                                                        },
                                                        child: const HargaHewan(
                                                          namaGambar: "kelinci",
                                                          harga: 30,
                                                          player: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Visibility(
                                                      visible: isMonkey2Choosen,
                                                      child: InkWell(
                                                        onTap: () {
                                                          if (koinPlayer2 > 54) {
                                                            setState(() {
                                                              isRabbit2Choosen = false;
                                                              isRhino2Choosen = false;
                                                              isSkip2Choosen = false;
                                                            });
                                                            logicGamePlay(2, 55, "monyet", false);
                                                          }
                                                        },
                                                        child: const HargaHewan(
                                                          namaGambar: "monyet",
                                                          harga: 55,
                                                          player: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Visibility(
                                                      visible: isRhino2Choosen,
                                                      child: InkWell(
                                                        onTap: () {
                                                          if (koinPlayer2 > 94) {
                                                            setState(() {
                                                              isRabbit2Choosen = false;
                                                              isMonkey2Choosen = false;
                                                              isSkip2Choosen = false;
                                                            });
                                                            logicGamePlay(2, 95, "badak", false);
                                                          }
                                                        },
                                                        child: const HargaHewan(
                                                          namaGambar: "badak",
                                                          harga: 95,
                                                          player: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isSkip2Choosen,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isRabbit2Choosen = false;
                                            isSkip2Choosen = false;
                                            isMonkey2Choosen = false;
                                            isRhino2Choosen = false;
                                          });
                                          logicGamePlay(2, 0, "", true);
                                        },
                                        child: Image.asset(
                                          imgTombolExit,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: screenWidth / 1.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RotatedBox(
                                    quarterTurns: 2,
                                    child: BlocBuilder<Player_2Cubit, Player_2State>(
                                      builder: (context, state) {
                                        return Text(state.player_2.nama, style: jomhuriaBlack20);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            //player 1
                            BlocBuilder<Player_1Cubit, Player_1State>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: screenWidth / 1.3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(state.player_1.nama, style: jomhuriaBlack20),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(width: 10, color: lightBlue)),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: yellow,
                                          border: Border.all(
                                            color: yellow, // Warna kuning
                                            width: 10, // Ketebalan border
                                          ),
                                          borderRadius: BorderRadius.circular(18), // Radius 18
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Visibility(
                                                  visible: isRabbit1Choosen,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (koinPlayer1 > 29) {
                                                        setState(() {
                                                          isMonkey1Choosen = false;
                                                          isElephant1Choosen = false;
                                                          isSkip1Choosen = false;
                                                        });

                                                        logicGamePlay(1, 30, "kelinci", false);
                                                      }
                                                    },
                                                    child: const HargaHewan(
                                                      namaGambar: "kelinci",
                                                      harga: 30,
                                                      player: 1,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Visibility(
                                                  visible: isMonkey1Choosen,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (koinPlayer1 > 54) {
                                                        setState(() {
                                                          isRabbit1Choosen = false;
                                                          isElephant1Choosen = false;
                                                          isSkip1Choosen = false;
                                                        });
                                                        logicGamePlay(1, 55, "monyet", false);
                                                      }
                                                    },
                                                    child: const HargaHewan(
                                                      namaGambar: "monyet",
                                                      harga: 55,
                                                      player: 1,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Visibility(
                                                  visible: isElephant1Choosen,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (koinPlayer1 > 94) {
                                                        setState(() {
                                                          isRabbit1Choosen = false;
                                                          isMonkey1Choosen = false;
                                                          isSkip1Choosen = false;
                                                        });
                                                        logicGamePlay(1, 95, "gajah", false);
                                                      }
                                                    },
                                                    child: const HargaHewan(
                                                      namaGambar: "gajah",
                                                      harga: 95,
                                                      player: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                Visibility(
                                  visible: isSkip1Choosen,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isRabbit1Choosen = false;
                                        isSkip1Choosen = false;
                                        isMonkey1Choosen = false;
                                        isElephant1Choosen = false;
                                      });
                                      logicGamePlay(1, 0, "", true);
                                    },
                                    child: Image.asset(
                                      imgTombolExit,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocBuilder<Player_1Cubit, Player_1State>(
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        Image.asset(iconKoin),
                                        Text("${state.player_1.koin}", style: jomhuriaBlack20),
                                      ],
                                    );
                                  },
                                ),
                                Image.asset(iconHapus),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: hasClickPop,
                      child: Container(
                        height: screenHeight,
                        width: screenWidth,
                        color: white.withOpacity(0.3),
                      ),
                    ),
                    PopupPause(
                      visible: hasClickPop,
                      onPlayPausePressed: () {
                        setState(() {
                          hasClickPop = false;
                        });
                      },
                    ),
                  ],
                ),
              )

            //ukuran hp diatas 750
            : Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imgBackgroundInformation), fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 30),
                          //player 2
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: Image.asset(iconHapus),
                              ),
                              BlocBuilder<Player_2Cubit, Player_2State>(
                                builder: (context, state) {
                                  return RotatedBox(
                                    quarterTurns: 2,
                                    child: Row(
                                      children: [
                                        Image.asset(iconKoin),
                                        Text("${state.player_2.koin}", style: jomhuriaBlack20),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          RotatedBox(
                              quarterTurns: 2,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 10, color: lightBlue),
                                      ),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: yellow,
                                            border: Border.all(
                                              color: yellow,
                                              width: 10,
                                            ),
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Visibility(
                                                    visible: isRabbit2Choosen,
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (koinPlayer2 > 29) {
                                                          setState(() {
                                                            isMonkey2Choosen = false;
                                                            isRhino2Choosen = false;
                                                            isSkip2Choosen = false;
                                                          });
                                                          logicGamePlay(2, 30, "kelinci", false);
                                                        }
                                                      },
                                                      child: const HargaHewan(
                                                        namaGambar: "kelinci",
                                                        harga: 30,
                                                        player: 2,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Visibility(
                                                    visible: isMonkey2Choosen,
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (koinPlayer2 > 54) {
                                                          setState(() {
                                                            isRabbit2Choosen = false;
                                                            isRhino2Choosen = false;
                                                            isSkip2Choosen = false;
                                                          });
                                                          logicGamePlay(2, 55, "monyet", false);
                                                        }
                                                      },
                                                      child: const HargaHewan(
                                                        namaGambar: "monyet",
                                                        harga: 55,
                                                        player: 2,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Visibility(
                                                    visible: isRhino2Choosen,
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (koinPlayer2 > 94) {
                                                          setState(() {
                                                            isRabbit2Choosen = false;
                                                            isMonkey2Choosen = false;
                                                            isSkip2Choosen = false;
                                                          });
                                                          logicGamePlay(2, 95, "badak", false);
                                                        }
                                                      },
                                                      child: const HargaHewan(
                                                        namaGambar: "badak",
                                                        harga: 95,
                                                        player: 2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isSkip2Choosen,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isRabbit2Choosen = false;
                                          isSkip2Choosen = false;
                                          isMonkey2Choosen = false;
                                          isRhino2Choosen = false;
                                        });
                                        logicGamePlay(2, 0, "", true);
                                      },
                                      child: Image.asset(
                                        imgTombolExit,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: screenWidth / 1.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: BlocBuilder<Player_2Cubit, Player_2State>(
                                    builder: (context, state) {
                                      return Text(state.player_2.nama, style: jomhuriaBlack20);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          //player 1
                          BlocBuilder<Player_1Cubit, Player_1State>(
                            builder: (context, state) {
                              return SizedBox(
                                width: screenWidth / 1.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(state.player_1.nama, style: jomhuriaBlack20),
                                  ],
                                ),
                              );
                            },
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  decoration: BoxDecoration(border: Border.all(width: 10, color: lightBlue)),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: yellow,
                                        border: Border.all(
                                          color: yellow, // Warna kuning
                                          width: 10, // Ketebalan border
                                        ),
                                        borderRadius: BorderRadius.circular(18), // Radius 18
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Visibility(
                                                visible: isRabbit1Choosen,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (koinPlayer1 > 29) {
                                                      setState(() {
                                                        isMonkey1Choosen = false;
                                                        isElephant1Choosen = false;
                                                        isSkip1Choosen = false;
                                                      });

                                                      logicGamePlay(1, 30, "kelinci", false);
                                                    }
                                                  },
                                                  child: const HargaHewan(
                                                    namaGambar: "kelinci",
                                                    harga: 30,
                                                    player: 1,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Visibility(
                                                visible: isMonkey1Choosen,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (koinPlayer1 > 54) {
                                                      setState(() {
                                                        isRabbit1Choosen = false;
                                                        isElephant1Choosen = false;
                                                        isSkip1Choosen = false;
                                                      });
                                                      logicGamePlay(1, 55, "monyet", false);
                                                    }
                                                  },
                                                  child: const HargaHewan(
                                                    namaGambar: "monyet",
                                                    harga: 55,
                                                    player: 1,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Visibility(
                                                visible: isElephant1Choosen,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (koinPlayer1 > 94) {
                                                      setState(() {
                                                        isRabbit1Choosen = false;
                                                        isMonkey1Choosen = false;
                                                        isSkip1Choosen = false;
                                                      });
                                                      logicGamePlay(1, 95, "gajah", false);
                                                    }
                                                  },
                                                  child: const HargaHewan(
                                                    namaGambar: "gajah",
                                                    harga: 95,
                                                    player: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              Visibility(
                                visible: isSkip1Choosen,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isRabbit1Choosen = false;
                                      isSkip1Choosen = false;
                                      isMonkey1Choosen = false;
                                      isElephant1Choosen = false;
                                    });
                                    logicGamePlay(1, 0, "", true);
                                  },
                                  child: Image.asset(
                                    imgTombolExit,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<Player_1Cubit, Player_1State>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      Image.asset(iconKoin),
                                      Text("${state.player_1.koin}", style: jomhuriaBlack20),
                                    ],
                                  );
                                },
                              ),
                              Image.asset(iconHapus),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: hasClickPop,
                    child: Container(
                      height: screenHeight,
                      width: screenWidth,
                      color: white.withOpacity(0.3),
                    ),
                  ),
                  PopupPause(
                    visible: hasClickPop,
                    onPlayPausePressed: () {
                      setState(() {
                        hasClickPop = false;
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
