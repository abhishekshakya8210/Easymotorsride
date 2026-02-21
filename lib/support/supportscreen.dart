import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';


class NeedHelp extends StatelessWidget {
  const NeedHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth= MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Support',style: TextStyle(fontSize: 27,color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:Column(
            children: [
             SizedBox(height: screenheight*0.02,),
             Image(image: AssetImage('assets/logo.png'),height: 200,width: 200,),
             SizedBox(height: screenheight*0.02,),
             Abhi(icon: Icons.pages, name: 'Frequntly Answerd\nQuetions'),
              SizedBox(height: screenheight*0.02,),
             Abhi(icon: Icons.search, name: 'Terms & Policies'),
              SizedBox(height: screenheight*0.02,),


GestureDetector(
  onTap: () async {
    String contactname = "9648628225";

    if (Platform.isAndroid) {
      String url =
          "whatsapp://send?phone=$contactname&text=${Uri.encodeComponent('Hi, I need help')}";
      await launchUrl(Uri.parse(url));
    } else {
      String url =
          "https://wa.me/$contactname?text=${Uri.encodeComponent('Hi, I need help')}";
      await launchUrl(Uri.parse(url));
    }
  },
  child: Abhi(icon: Icons.picture_as_pdf, name: 'Need help? WhatsApp Us'),
)

             
        
            ],
          )
        ),
      ),
    );
  }
}

class Abhi extends StatelessWidget {
  final String name;
  final IconData icon;   // <-- CHANGE HERE

  Abhi({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,             // <-- This is the correct use
              size: 40,
              color: Colors.green,
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}