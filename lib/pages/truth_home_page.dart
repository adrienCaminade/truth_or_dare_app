import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:true_or_dare_app/components/dare_background_gradient.dart';
import 'package:true_or_dare_app/components/truth_background_gradient.dart';
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
        ],
      ),
    );
  }
}
