import 'package:flutter/material.dart';
import '../widgets/splashWidget.dart';
import '../widgets/const.dart' as cons;

class SplashScreen extends StatelessWidget {
///define Route name
  static String routeName=cons.cSplashScreenRoute;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackground(context),
            SplashWidget(),
          ],
        ),
      ),
    );
  }
  //build background widget
  Widget _buildBackground(BuildContext aContext){
    //initialized backgroundcontext

    final bgImg=Image.asset(cons.cBackgroundImage,fit:BoxFit.cover);
    //pre cache image
    precacheImage(bgImg.image,aContext);
    return Positioned.fill(child:bgImg);
  }



}
