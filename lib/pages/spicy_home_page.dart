import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:true_or_dare_app/components/spicy_background_gradient.dart';
import 'package:true_or_dare_app/pages/classic_home_page.dart';
import '../components/gradient_text.dart';
import '../constants/constants.dart';

class DareHomePage extends StatefulWidget {
  const DareHomePage({super.key});

  @override
  State<DareHomePage> createState() => _DareHomePageState();
}

class _DareHomePageState extends State<DareHomePage> {
  bool selectedDare = false;
  bool selectedTruth = false;

  Future<void> displayTruthBox() async {
    if (!selectedTruth) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        selectedTruth = true;
      });
    }
  }

  Future<void> displayDareBox() async {
    if (!selectedDare) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        selectedDare = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DareBackgroundGradient(),

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
                                Constants.titleBlackDareColor,
                                Constants.titleRedDareColor.withOpacity(0.3),
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
                          Constants.titleRedDareColor2,
                          Constants.titleRedDareColor.withOpacity(0),
                        ],
                      ),
                      text: 'Spicy',
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
                              //      width: selectedTruth ? 250.0 : 150.0,
                              //      height: selectedTruth ? 150.0 : 100.0,
                              width: selectedDare ? 250.0 : 0,
                              height: selectedDare ? 200.0 : 0,
                              left: selectedDare ? -20 : 30,
                              bottom: selectedDare ? -10 : 150,
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn,
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
                                          child: Text(
                                            '',
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


                            AnimatedPositioned(
                              //      width: selectedTruth ? 250.0 : 150.0,
                              //      height: selectedTruth ? 150.0 : 100.0,
                              width: selectedDare ? 150.0 : 150.0,
                              height: selectedDare ? 100.0 : 100.0,
                              left: selectedDare ? 30.0 : -45,
                              bottom: selectedDare ? 150 : 100,
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: () async {
                                  await displayDareBox();
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
                              //      width: selectedTruth ? 250.0 : 150.0,
                              //      height: selectedTruth ? 150.0 : 100.0,
                              width: selectedDare ? 60.0 : 0,
                              height: selectedDare ? 60.0 : 0,
                              left: selectedDare ? 150 : 30,
                              bottom: selectedDare ? -30 : 150,
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectedDare = !selectedDare;
                                  });
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
                          ],
                        ),

                      if(!selectedDare)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                          AnimatedPositioned(
                            //      width: selectedTruth ? 250.0 : 150.0,
                            //      height: selectedTruth ? 150.0 : 100.0,
                            width: selectedTruth ? 250.0 : 0,
                            height: selectedTruth ? 200.0 : 0,
                            left: selectedTruth ? -20 : 30,
                            bottom: selectedTruth ? -10 : 150,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
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
                                        child: Text(
                                          '',
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


                        AnimatedPositioned(
                          //      width: selectedTruth ? 250.0 : 150.0,
                          //      height: selectedTruth ? 150.0 : 100.0,
                          width: selectedTruth ? 150.0 : 150.0,
                          height: selectedTruth ? 100.0 : 100.0,
                          left: selectedTruth ? 30.0 : 100,
                          bottom: selectedTruth ? 150 : 100,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          child: GestureDetector(
                            onTap: () async {
                                await displayTruthBox();
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
                          //      width: selectedTruth ? 250.0 : 150.0,
                          //      height: selectedTruth ? 150.0 : 100.0,
                          width: selectedTruth ? 60.0 : 0,
                          height: selectedTruth ? 60.0 : 0,
                          left: selectedTruth ? 150 : 30,
                          bottom: selectedTruth ? -30 : 150,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedTruth = !selectedTruth;
                              });
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
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => TruthHomePage(),
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
                              child: SvgPicture.asset('assets/classic.svg', width: 15
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
