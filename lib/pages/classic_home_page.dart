import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:true_or_dare_app/components/classic_background_gradient.dart';
import 'package:true_or_dare_app/pages/spicy_home_page.dart';
import '../components/gradient_text.dart';
import '../constants/constants.dart';
import '../models/Game.dart';
import '../services/api.dart';
import '../services/game_utils.dart';

class ClassicHomePage extends StatefulWidget {
  const ClassicHomePage({super.key});

  @override
  State<ClassicHomePage> createState() => _ClassicHomePageState();
}

class _ClassicHomePageState extends State<ClassicHomePage> {
  bool selectedDare = false;
  bool selectedTruth = false;

  late Future<List<Game>> dareClassic;
  late Future<List<Game>> truthClassic;

  final gameUtils = GameUtils();

  Future<void> handleDisplayDare() async {
    gameUtils.displayBox(selectedDare, () {
      setState(() {
        selectedDare = true;
      });
    });
  }

  Future<void> handleDisplayTruth() async {
    gameUtils.displayBox(selectedTruth, () {
      setState(() {
        selectedTruth = true;
      });
    });
  }


  @override
  void initState() {
    super.initState();
    dareClassic = API().getDareClassic();
    truthClassic = API().getTruthClassic();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClassicBackgroundGradient(),

          Positioned(
            top: 90,
            left: 30,
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none, // Permet aux widgets de déborder du Stack
              children: [
                // Container avec effet de flou
                Container(
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 300,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white60, Colors.white10],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2, color: Colors.white30),
                        ),
                        child: Center(
                          child: GradientText(
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.titleBlackColor,
                                Constants.titleBlueClassicColor.withOpacity(0.3),
                              ],
                            ),
                            text: 'Action ou Vérité',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Texte "Spicy" placé au-dessus du container
                Positioned(
                  bottom: -20, // Positionnement pour faire déborder le texte du container
                  child: Transform.rotate(
                    angle: -0.3,
                    child: GradientText(
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.titleBlueClassicColor,
                          Constants.titleBlueClassicColor.withOpacity(0),
                        ],
                      ),
                      text: 'Classic',
                    ),
                  ),
                ),
              ],
            ),
          ),


          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 300,
                  width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none, // Permet aux widgets de déborder du Stack
                    children: [
                      if(!selectedTruth)
                        Stack(
                          clipBehavior: Clip.none,
                          children: [

                            AnimatedPositioned(
                              width: selectedDare ? 250.0 : 0,
                              height: selectedDare ? 200.0 : 0,
                              left: selectedDare ? -20 : 30,
                              bottom: selectedDare ? -10 : 150,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              child: Offstage(
                                offstage: !selectedDare,  // Contrôle la visibilité du FutureBuilder
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 200,
                                  width: 200,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomCenter,
                                            colors: [Colors.white60, Colors.white10],
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(width: 2, color: Colors.white30),
                                        ),
                                        child: Center(
                                          child: FutureBuilder<List<Game>>(
                                            future: dareClassic,
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return const Center(child: CircularProgressIndicator());
                                              } else if (snapshot.hasError) {
                                                return Center(child: Text('Error: ${snapshot.error}'));
                                              } else if (snapshot.hasData) {
                                                final List<Game> dares = snapshot.data!;
                                                final randomDare = gameUtils.getRandomDare(dares);
                                                return Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      randomDare.description,
                                                      style: TextStyle(fontSize: 18),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return const Center(child: Text('Aucune action disponible.'));
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            AnimatedPositioned(
                              width: selectedDare ? 150.0 : 150.0,
                              height: selectedDare ? 100.0 : 100.0,
                              left: selectedDare ? 30.0 : -45,
                              bottom: selectedDare ? 150 : 100,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: () async {
                                  await handleDisplayDare();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 100,
                                  width: 150,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomCenter,
                                            colors: [Colors.white60, Colors.white10],
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(width: 2, color: Colors.white30),
                                        ),
                                        child: Center(
                                            child: Text(
                                              'Action',
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            AnimatedPositioned(
                              width: selectedDare ? 60.0 : 0,
                              height: selectedDare ? 60.0 : 0,
                              left: selectedDare ? 150 : 30,
                              bottom: selectedDare ? -30 : 150,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectedDare = !selectedDare;
                                  });
                                },
                                child: Offstage(
                                  offstage: !selectedDare,  // Contrôle la visibilité du FutureBuilder
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 60,
                                    width: 60,
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [Colors.white60, Colors.white10],
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(width: 2, color: Colors.white30),
                                          ),
                                          child: Center(
                                              child: Text(
                                                'X',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      if(!selectedDare)
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            AnimatedPositioned(
                              width: selectedTruth ? 250.0 : 0,
                              height: selectedTruth ? 200.0 : 0,
                              left: selectedTruth ? -20 : 30,
                              bottom: selectedTruth ? -10 : 150,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              child: Offstage(
                                offstage: !selectedTruth,  // Contrôle la visibilité du FutureBuilder
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 200,
                                  width: 200,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomCenter,
                                            colors: [Colors.white60, Colors.white10],
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(width: 2, color: Colors.white30),
                                        ),
                                        child: Center(
                                          child: FutureBuilder<List<Game>>(
                                            future: truthClassic,
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return const Center(child: CircularProgressIndicator());
                                              } else if (snapshot.hasError) {
                                                return Center(child: Text('Error: ${snapshot.error}'));
                                              } else if (snapshot.hasData) {
                                                final List<Game> truthes = snapshot.data!;
                                                final randomTruth = gameUtils.getRandomTruth(truthes);

                                                return Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      randomTruth.description,
                                                      style: TextStyle(fontSize: 18),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return const Center(child: Text('Aucune vérité disponible.'));
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),


                            AnimatedPositioned(
                              width: selectedTruth ? 150.0 : 150.0,
                              height: selectedTruth ? 100.0 : 100.0,
                              left: selectedTruth ? 30.0 : 100,
                              bottom: selectedTruth ? 150 : 100,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: () async {
                                  await handleDisplayTruth();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 100,
                                  width: 150,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomCenter,
                                            colors: [Colors.white60, Colors.white10],
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(width: 2, color: Colors.white30),
                                        ),
                                        child: Center(
                                            child: Text(
                                              'Vérité',
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.black,
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            AnimatedPositioned(
                              width: selectedTruth ? 60.0 : 0,
                              height: selectedTruth ? 60.0 : 0,
                              left: selectedTruth ? 150 : 30,
                              bottom: selectedTruth ? -30 : 150,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectedTruth = !selectedTruth;
                                  });
                                },
                                child: Offstage(
                                  offstage: !selectedTruth,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 60,
                                    width: 60,
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [Colors.white60, Colors.white10],
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(width: 2, color: Colors.white30),
                                          ),
                                          child: Center(
                                              child: Text(
                                                'X',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),

              ],
            ),
          ),


          Positioned(
            bottom: 0,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none, // Permet aux widgets de déborder du Stack
              children: [
                // Container avec effet de flou
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpicyHomePage()),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => SpicyHomePage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = 0.0;
                            const end = 1.0;
                            const curve = Curves.easeInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            var opacityAnimation = animation.drive(tween);

                            return FadeTransition(opacity: opacityAnimation, child: child);
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [Colors.white60, Colors.white10],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 2, color: Colors.white30),
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/spicy.svg', width: 15
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
