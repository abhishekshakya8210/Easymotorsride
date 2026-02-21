
import 'package:easytextride/loginmathod/loginscreen.dart';
import 'package:easytextride/providerwithloginandsignup/loginprovider.dart';
import 'package:easytextride/providerwithloginandsignup/signupprovider.dart';
import 'package:easytextride/splashmathod/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>Loginprovider()),
      ChangeNotifierProvider(create: (_)=>Signupprovider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     
      home: 
      Loginscreen()
      //SplashScreen()
    ),
    );
  }
}

