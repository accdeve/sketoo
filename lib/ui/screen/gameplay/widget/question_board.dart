import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketoo/cubit/player_1/cubit/player_1_cubit.dart';
import 'package:sketoo/model/comic.dart';
import 'package:sketoo/utils/colors.dart';
import 'package:sketoo/utils/typograhpy.dart';

class QuestionBoard extends StatefulWidget {
  final String pertanyaan;
  final String route;
  final bool isQuestion;
  const QuestionBoard(
      {super.key,
      required this.pertanyaan,
      required this.route,
      required this.isQuestion});

  @override
  State<QuestionBoard> createState() => _QuestionBoardState();
}

class _QuestionBoardState extends State<QuestionBoard> {
  int _currentPagePlayer1 = 0;
  int _currentPagePlayer2 = 0;
  int babak = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      babak = context.read<Player_1Cubit>().state.player_1.babak;
    });
  }

  List<Widget> comic() {
    if (babak == 1) {
      return komikBabak1Ortu;
    } else if (babak == 2) {
      return komikBabak2Ortu;
    } else if (babak == 3) {
      return komikBabak3Ortu;
    } else {
      return komikBabak4Ortu;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: lightBlue,
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 8),
              blurRadius: 12,
            ),
          ],
        ),
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.circular(18), // Radius 18
          ),
          child: !widget.isQuestion

              // comic
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // player 2
                      Transform.rotate(
                              angle: 3.14,
                              child: !widget.isQuestion
                                  ? Column(
                                      children: [
                                        SizedBox(
                                            height: !widget.isQuestion
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2.7
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5,
                                            child: PageView(
                                              onPageChanged: (index) {
                                                setState(() {
                                                  _currentPagePlayer2 = index;
                                                });
                                              },
                                              children: comic(),
                                            )),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                              comic().length,
                                              (index) => Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4),
                                                    width:
                                                        _currentPagePlayer2 ==
                                                                index
                                                            ? 24
                                                            : 8,
                                                    height: 8,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color:
                                                          _currentPagePlayer2 ==
                                                                  index
                                                              ? Colors.blue
                                                              : Colors.grey,
                                                    ),
                                                  )),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      widget.pertanyaan,
                                      textAlign: TextAlign.center,
                                      style: juaBlack15,
                                    ))
                          .animate()
                          .fade(duration: 1000.ms),

                      // button
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, widget.route);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(purple),
                          elevation: MaterialStateProperty.all<double>(4),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.grey.withOpacity(0.4)),
                        ),
                        child: Text(
                          "Next",
                          style: poppinsWhite20,
                        ),
                      )
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .shake(
                            rotation: 0.1,
                            hz: 1.7,
                          ),

                      const SizedBox(height: 12),

                      // player 1
                      !widget.isQuestion
                          ? Column(
                              children: [
                                SizedBox(
                                    height: !widget.isQuestion
                                        ? MediaQuery.of(context).size.height /
                                            2.7
                                        : MediaQuery.of(context).size.height /
                                            5,
                                    child: PageView(
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentPagePlayer1 = index;
                                        });
                                      },
                                      children: comic(),
                                    )),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List<Widget>.generate(
                                      comic().length,
                                      (index) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            width: _currentPagePlayer1 == index
                                                ? 24
                                                : 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color:
                                                  _currentPagePlayer1 == index
                                                      ? Colors.blue
                                                      : Colors.grey,
                                            ),
                                          )),
                                ),
                              ],
                            ).animate().fade(duration: 1000.ms)
                          : Text(
                              widget.pertanyaan,
                              textAlign: TextAlign.center,
                              style: juaBlack15,
                            ).animate().fade(duration: 1000.ms)
                    ],
                  ),
                )

              // pertanyaan
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // player 2
                    Transform.rotate(
                            angle: 3.14,
                            child: !widget.isQuestion
                                ? Column(
                                    children: [
                                      SizedBox(
                                          height: !widget.isQuestion
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.7
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  5,
                                          child: PageView(
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentPagePlayer2 = index;
                                              });
                                            },
                                            children: comic(),
                                          )),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List<Widget>.generate(
                                            comic().length,
                                            (index) => Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  width: _currentPagePlayer2 ==
                                                          index
                                                      ? 24
                                                      : 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color:
                                                        _currentPagePlayer2 ==
                                                                index
                                                            ? Colors.blue
                                                            : Colors.grey,
                                                  ),
                                                )),
                                      ),
                                    ],
                                  )
                                : Text(
                                    widget.pertanyaan,
                                    textAlign: TextAlign.center,
                                    style: juaBlack15,
                                  ))
                        .animate()
                        .fade(duration: 1000.ms),

                    // button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, widget.route);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(purple),
                        elevation: MaterialStateProperty.all<double>(4),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.grey.withOpacity(0.4)),
                      ),
                      child: Text(
                        "Next",
                        style: poppinsWhite20,
                      ),
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(),
                        )
                        .shake(
                          rotation: 0.1,
                          hz: 1.7,
                        ),

                    // player 1
                    !widget.isQuestion
                        ? Column(
                            children: [
                              SizedBox(
                                  height: !widget.isQuestion
                                      ? MediaQuery.of(context).size.height / 2.7
                                      : MediaQuery.of(context).size.height / 5,
                                  child: PageView(
                                    onPageChanged: (index) {
                                      setState(() {
                                        _currentPagePlayer1 = index;
                                      });
                                    },
                                    children: comic(),
                                  )),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(
                                    comic().length,
                                    (index) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          width: _currentPagePlayer1 == index
                                              ? 24
                                              : 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: _currentPagePlayer1 == index
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                        )),
                              ),
                            ],
                          ).animate().fade(duration: 1000.ms)
                        : Text(
                            widget.pertanyaan,
                            textAlign: TextAlign.center,
                            style: juaBlack15,
                          ).animate().fade(duration: 1000.ms)
                  ],
                ),
        ),
      ),
    );
  }
}
