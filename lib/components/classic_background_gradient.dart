import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class ClassicBackgroundGradient extends StatelessWidget {
  const ClassicBackgroundGradient({super.key});

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
                  Constants.classicColor,
                  Color.fromRGBO(255, 255, 255, 0),
                ],
              ),
            ),
          ),

          Positioned(
            top: -50,
            left: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.classicColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            right: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.classicColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            left: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.classicColor.withOpacity(0),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            right: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                width: 350.0,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Constants.classicColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
          ),

          Positioned(
            top: -50,
            right: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50,
                sigmaY: 50,
              ),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Constants.classicColor.withOpacity(0),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
          ),

          Positioned(
            top: 50,
            right: 30,
            child: Transform.rotate(
                angle: -10,
                child: SvgPicture.asset('assets/classic.svg', width: 85
                )
            ),
          ),

          Positioned(
            top: 150,
            left: 30,
            child: Transform.rotate(
                angle: 8,
                child: SvgPicture.asset('assets/classic.svg', width: 70
                )
            ),
          ),

          Positioned(
            top: 215,
            right: 30,
            child: Transform.rotate(
                angle: 12,
                child: SvgPicture.asset('assets/classic.svg', width: 80
                )
            ),
          ),

          Positioned(
            bottom: 150,
            left: 50,
            child: SvgPicture.asset('assets/classic.svg', width: 60),
          ),

          Positioned(
            bottom: -90,
            right: 50,
            child: SvgPicture.asset('assets/classic.svg', width: 100),
          )
        ],
      ),
    );
  }
}
