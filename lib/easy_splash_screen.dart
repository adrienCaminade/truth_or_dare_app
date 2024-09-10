import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:true_or_dare_app/pages/home_page.dart';

import 'constants/constants.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/spashLogo.png', width: 100),

      title: Text(
        "Action ou Vérité",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Constants.titleBlackColor,
        ),
      ),
      backgroundColor: Constants.homePageColor,
      showLoader: true,
      loadingText: Text(
        "Loading...",
        style: TextStyle(color: Constants.titleBlackColor),
      ),
      navigator: HomePage(),
      durationInSeconds: 5,
    );
  }
}