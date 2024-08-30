// Cercle rouge flou en bas à droite
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class HomeBackgroundGradient extends StatelessWidget {
  const HomeBackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fond en dégradé couvrant toute la page
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.homePageColor,
                  Color.fromRGBO(255, 255, 255, 0),
                ],
              ),
            ),
          ),

          // Cercle rouge flou en haut à gauche
          Positioned(
            top: -50,
            left: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20, // Réduit le flou pour un effet plus visible
                sigmaY: 20,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.homePageColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(200), // Ajusté pour un cercle
                ),
              ),
            ),
          ),

          // Cercle rouge flou en bas à droite
          Positioned(
            bottom: -50,
            right: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20, // Réduit le flou pour un effet plus visible
                sigmaY: 20,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.homePageColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(200), // Ajusté pour un cercle
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            left: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20, // Réduit le flou pour un effet plus visible
                sigmaY: 20,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.homePageColor.withOpacity(0),
                  borderRadius: BorderRadius.circular(200), // Ajusté pour un cercle
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            right: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20, // Réduit le flou pour un effet plus visible
                sigmaY: 20,
              ),
              child: Container(
                width: 350.0,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Constants.homePageColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(200), // Ajusté pour un cercle
                ),
              ),
            ),
          ),

          Positioned(
            top: -50,
            right: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50, // Réduit le flou pour un effet plus visible
                sigmaY: 50,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.homePageColor.withOpacity(0),
                  borderRadius: BorderRadius.circular(200), // Ajusté pour un cercle
                ),
              ),
            ),
          ),

          Positioned(
            top: 50,
            right: 0,
            child: Transform.rotate(
                angle: 0,
                child: SvgPicture.asset('assets/home_classic.svg', width: 150
                )
            ),
          ),

          Positioned(
            top: 180,
            left: 150,
            child: Transform.rotate(
                angle: 0,
                child: SvgPicture.asset('assets/home_spicy.svg', width: 150
                )
            ),
          ),

          Positioned(
            top: 400,
            right: 30,
            child: Transform.rotate(
                angle: 13,
                child: SvgPicture.asset('assets/classic.svg', width: 80
                )
            ),
          ),

          Positioned(
            top: 250,
            left: 20,
            child: SvgPicture.asset('assets/spicy.svg', width: 80),
          ),


          Positioned(
            bottom: -70,
            left: -30,
            child: Transform.rotate(
                angle: 1,
                child: SvgPicture.asset('assets/home_spicy.svg', width: 150
                )
            ),
          ),


          // Autre contenu ici, si nécessaire
        ],
      ),
    );
  }
}
