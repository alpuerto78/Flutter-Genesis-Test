import 'package:flutter/material.dart';
import '../widgets/const.dart' as cons;
import '../onboarding/components/slandingClipper.dart';
import 'dart:math' as math;

class Homepage extends StatelessWidget {
  final onboard1Img=AssetImage(cons.cOnboard1);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width:size.width,
                  height:size.height *.6,
                  fit:BoxFit.cover,
                  image:onboard1Img,
                ),
                Transform(
                  alignment:Alignment.center,
                  transform:  Matrix4.rotationY(math.pi),
                  child: ClipPath(
                    clipper:SlandingClipper(),
                    child:Container (
                      height:size.height * 0.4,
                      color:cons.cMainColor,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: size.height*0.65,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(cons.appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Homepage',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        color: cons.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height:size.height * 0.02),
                    Text(
                      'Lorem ipsum dolor sit amet, \n consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.normal,
                        color: cons.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left:0,
              right:0,
              child:Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  Container(
                    margin:EdgeInsets.symmetric(horizontal:cons.appPadding/4),
                    width: 15,
                    height:15,
                    decoration: BoxDecoration(
                      border:Border.all(color:cons.cBorderColor,width:2),
                      shape: BoxShape.circle,
                      color: cons.cMainColor,
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.symmetric(horizontal:cons.appPadding/4),
                    width: 15,
                    height:15,
                    decoration: BoxDecoration(
                      border:Border.all(color:cons.cBorderColor,width:2),
                      shape: BoxShape.circle,
                      color: cons.cMainColor,
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.symmetric(horizontal:cons.appPadding/4),
                    width: 15,
                    height:15,
                    decoration: BoxDecoration(
                      border:Border.all(color:cons.cBorderColor,width:2),
                      shape: BoxShape.circle,
                      color: cons.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(vertical:cons.appPadding*2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    // child: TextButton(
                    //   onPressed: ()=>print('Skip'),
                    //   child: Text(
                    //     'Skip',
                    //     style:TextStyle(
                    //       fontFamily: 'Lato',
                    //       color:cons.black,
                    //       fontSize:20.0,
                    //     ),
                    //   ),
                    // ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(right:cons.appPadding),
                    child: FloatingActionButton(
                      onPressed: (){},
                      //lagyan ng link para sa homepage
                      backgroundColor: cons.white,
                      child:Icon(
                        Icons.done_rounded,
                        color: cons.cBorderColor,
                        size:30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
