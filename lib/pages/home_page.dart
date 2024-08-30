import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:true_or_dare_app/components/home_background_gradient.dart';
import 'package:true_or_dare_app/pages/spicy_home_page.dart';
import 'package:true_or_dare_app/pages/classic_home_page.dart';

import '../components/gradient_text.dart';
import '../constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          HomeBackgroundGradient(),

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
                                Constants.homePageColor2.withOpacity(0.3),
                              ],
                            ),
                            text: 'Action ou Vérité',
                          ),
                        ),
                      ),
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
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none, // Permet aux widgets de déborder du Stack
                  children: [
                    // Container avec effet de flou
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => DareHomePage(),
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
                                    'Spicy',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Constants.titleRedDareColor,
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
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
                                    'Classic',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Constants.titleBlueTruthColor,
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
