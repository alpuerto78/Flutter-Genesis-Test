import 'dart:async';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_icon/pages/homepage.dart';
import '../widgets/const.dart' as cons;
import '../onboarding/onboardScreenOne.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
 final logo= LogoWidget();
 final appName=AppNameWidget();

// final loginButton=LoginButtonWidget();
 bool _logoMoving =true;

 @override
 void initState(){
   super.initState();
   startTimer();
 }
 startTimer() async{
   var duration = Duration (seconds:4);
   return Timer (duration,route);
 }

 route() async {
   SharedPreferences prefs=await SharedPreferences.getInstance();
   final bool? look = prefs.getBool('look');
   Widget _Screen;
   if (look ==null || look ==false){
     _Screen=onBoardingScreenOne();
   }
   else{
     _Screen=Homepage();
   }
 }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildAnimationLogo(),
                SizedBox(height:16.0),
                (!_logoMoving) ? _buildAnimationAppName(): Spacer(),
              ],
            ),
          ),
          Expanded(child: (!_logoMoving) ? _buildAnimationButton() :  Container()),
        ],
      ),
    );
  }
  Widget _buildAnimationLogo(){
   return Container(
     child: Animator(
       tweenMap: {
         cons.cOpacity: Tween<double> (begin:0,end:1),
         cons.cScale: Tween<double>(begin:10,end: 1),
       },
       cycles: 1,
       curve: Curves.easeInOut,
       duration:Duration(milliseconds:1500),
       endAnimationListener: (anim){
         if (!this.mounted)return;
         setState((){
           _logoMoving=false;
         });
       },
       builder:(_,anim, __)=> FadeTransition(
           opacity: anim.getAnimation(cons.cOpacity),
         child:Transform.scale(scale: anim.getValue(cons.cScale),
         child:logo,
       ),
       ),
     ),
   );//Container
  }

  Widget _buildAnimationAppName(){
    return Animator(
      tweenMap:{
        cons.cOpacity:Tween<double>(begin:0,end:1),
        cons.cMotion:Tween<Offset>(begin:Offset(0,60),end:Offset(0,0)),
      },
      duration: Duration(milliseconds: 1500),
      cycles: 1,
      curve:Curves.easeInOut,
      builder:(_,anim,__)=>FadeTransition(
       opacity: anim.getAnimation(cons.cOpacity),
        child: Transform.translate(offset: anim.getValue(cons.cMotion),
        child: appName)
      ),
    );
  }

  Widget _buildAnimationButton(){
    return Animator(
      tweenMap:{
        cons.cOpacity:Tween<double>(begin:0,end:1),
        cons.cMotion:Tween<Offset>(begin: Offset(300,0),end:Offset(0,0)),
      },
      duration: Duration(milliseconds:1500),
      cycles: 1,
      curve:Curves.easeInOut,
      builder: (_,anim,__)=>FadeTransition(
        opacity:anim.getAnimation(cons.cOpacity),
        child:Transform.translate(
        offset: anim.getValue(cons.cMotion),
        //child: loginButton,
    ),
    ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final logoImg=Image.asset(cons.cLogoImage,fit: BoxFit.fitWidth,width:172, height:172);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height:170,
      child:ClipOval(
        child: logoImg,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color:Colors.black.withOpacity(0.4),
            offset:Offset(4.0,4.0),
            spreadRadius: 1.0,
          ),
        ]
      ),
    );
  }
}
class AppNameWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Genesis',
        style: TextStyle(fontSize:54),
      ),
    );
  }
}
//
// class LoginButtonWidget extends StatelessWidget {
//   _doOnLoginPressed(){}
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Align(
//         alignment:Alignment.centerRight,
//         child: Container(
//           width: 150,
//           height:70,
//           child: FloatingActionButton(
//             onPressed: _doOnLoginPressed,
//             elevation:6.0,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft: Radius.circular(35)),
//            ),
//             child: Row(
//               children: [
//                 Spacer(flex: 3),
//                 Text('Login...',style: TextStyle(fontSize: 34,color: cons.cFontColor)),
//                 Spacer(flex: 1),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



