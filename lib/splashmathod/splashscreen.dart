import 'package:easytextride/loginmathod/loginscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool state = false;

  @override
  void initState() {
    super.initState();

    
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        state = true;
      });
    });

  
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: state
            ?Image.asset('assets/splsh1.jpg',height: double.infinity,fit: BoxFit.cover,)    
            : Image.asset('assets/splashabhi.png') ,
      ),
    );
  }
}