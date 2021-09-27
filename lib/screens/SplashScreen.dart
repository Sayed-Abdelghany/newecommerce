import 'dart:async';
import 'package:new_ecommerce/screens/AdminScreen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:new_ecommerce/screens/SignInScreen.dart';
class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.popAndPushNamed(context, SignInScreen.id);
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        skip: Text("skip",style: TextStyle(fontSize: 20,color: Colors.blue),),
        done: Text("done",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
        next: Icon(Icons.arrow_forward,size: 30,color: Colors.blue,),
        showNextButton: true,
        showSkipButton: true,
        onDone: (){
          Navigator.popAndPushNamed(context,AdminScreen.id);
        },
        pages: [
          PageViewModel(

            decoration: PageDecoration(
              boxDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ws.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            titleWidget: Text("",style: TextStyle(color: Colors.white),),
            body: '',
          ),
          PageViewModel(

            decoration: PageDecoration(
              boxDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wq.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            titleWidget: Text("",style: TextStyle(color: Colors.white),),
            body: '',
          ),
        ],
      ),
    );
  }
}
