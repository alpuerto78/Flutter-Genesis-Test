
import 'package:flutter/material.dart';
import 'package:test_icon/onboarding/onboardScreenOne.dart';
import 'package:test_icon/pages/homepage.dart';
import 'package:test_icon/screens/splashscreen.dart';
import '../widgets/const.dart' as cons;
import '../widgets/route.dart';
import '../widgets/theme.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


 void main() async{

  Paint.enableDithering=true;
  WidgetsFlutterBinding.ensureInitialized();
  ///one-time onboard screen
  SharedPreferences prefs=await SharedPreferences.getInstance();
  final bool? look = prefs.getBool('look');
  Widget _Screen;
  if (look ==null || look ==false){
    _Screen=onBoardingScreenOne();
  }
  else{
    _Screen=Homepage();
  }
  ///disable landscape
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(SplashScreenMockupApp(_Screen));
}
class SplashScreenMockupApp extends StatelessWidget {
  final Widget _Screen;
  SplashScreenMockupApp(this._Screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: cons.cSplashScreenRoute,
      routes: appRouteTable,
      home:this._Screen,
    );
  }
}
