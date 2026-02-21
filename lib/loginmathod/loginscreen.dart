import 'package:easytextride/EasyRideColors/easyridecolors.dart';
import 'package:easytextride/botton/bottonnavi.dart';
import 'package:easytextride/loginmathod/mainloginscreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Center(child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            height: h*0.1,),
          Image(image: AssetImage('assets/splashabhi.png')),
          SizedBox(
            height: h*0.02,),
            Card(
              elevation: 5,
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: 
                Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50),
                  child: Row(children: [
                    Image(image: AssetImage('assets/google_icon.png')),
                    SizedBox(width: 20,),
                    Text('Continue with Google',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                  ],),
                ),),
              ),
            ),
           SizedBox(height: h*0.02,),
                    //  Text('----------------------- or ------------------------',style: TextStyle(fontSize: 16),) ,
                    Row(
          children: [
            Expanded(
        child: Divider(
          thickness: 1,
        ),
            ),
            Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "OR",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
            ),
            Expanded(
        child: Divider(
          thickness: 1,
        ),
            ),
          ],
        ),
                     SizedBox(height: h*0.02,),
                     Text('Already Singup with Mobile number',style: TextStyle(fontSize: 16),)  ,
                      SizedBox(height: h*0.04,),
                     ElevatedButton.icon(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mainloginscreen()));
                     },
                     style: ElevatedButton.styleFrom(fixedSize: Size(350, 50),backgroundColor: Colors.pink.shade50,shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15)
                     )),
                     icon: Icon(Icons.phone,size: 25,color: Easyridecolors.elevatedbotton,), 
                     label: Text('Login with Phone Number',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Easyridecolors.elevatedbotton),)),
                      SizedBox(height: h*0.02,),
                    // Text('Already Singup with Mobile number',style: TextStyle(fontSize: 16),)  ,
                    Padding(
                      padding: const EdgeInsets.only(top: 200,left: 20,right: 20,bottom: 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey, 
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "By continuing, you agree to our "),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: " and confirm that you have read our "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: "\nContact Support "),
                            TextSpan(
                              text: "Contact Us",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
        ],),
      )
      ),
    );
  }
}