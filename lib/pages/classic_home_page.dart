import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:true_or_dare_app/components/spicy_background_gradient.dart';
import 'package:true_or_dare_app/components/classic_background_gradient.dart';
import 'package:true_or_dare_app/pages/spicy_home_page.dart';
import '../components/gradient_text.dart';
import '../constants/constants.dart';

class TruthHomePage extends StatelessWidget {
  const TruthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TruthBackgroundGradient(),

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
                                Constants.titleBlueTruthColor.withOpacity(0.3),
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
                          Constants.titleBlueTruthColor,
                          Constants.titleBlueTruthColor.withOpacity(0),
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
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none, // Permet aux widgets de déborder du Stack
                  children: [
                    // Container avec effet de flou
                    Container(
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
                  ],
                ),

                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none, // Permet aux widgets de déborder du Stack
                  children: [
                    // Container avec effet de flou
                    Container(
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
                  ],
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
                      MaterialPageRoute(builder: (context) => DareHomePage()),
                    );
                  },
                  child: GestureDetector(
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
