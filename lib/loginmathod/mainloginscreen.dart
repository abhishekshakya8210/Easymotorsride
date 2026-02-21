import 'package:easytextride/EasyRideColors/easyridecolors.dart';
import 'package:easytextride/botton/bottonnavi.dart';
import 'package:easytextride/loginmathod/singupscreen.dart';
import 'package:easytextride/providerwithloginandsignup/loginprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:provider/provider.dart';

class Mainloginscreen extends StatefulWidget {
  
   Mainloginscreen({super.key});

  @override
  State<Mainloginscreen> createState() => _MainloginscreenState();
}

class _MainloginscreenState extends State<Mainloginscreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final loginprovider = Provider.of<Loginprovider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Center(child: Form(
            key:loginprovider.keyform,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Hi there 👋🏼',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: h*0.02,),
                  Text('What`s your phone number?',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height: h*0.02,),
                  Text('We`ll send you an SMS with a verification code to secore your account',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.grey),),
                  SizedBox(height: h*0.06,),
                  IntlPhoneField(
                    controller:loginprovider.phonecontroller,
                    // validator:(value) {
                    //   if(value==null||value.isempty){
                    //     return 'enter your mobile number';
                    //   }
                    // },
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
              borderSide: BorderSide(),
                    ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                    print(phone.completeNumber);
                },
            ),
            SizedBox(height: h*0.02,),
              Text('Enter your phone number without "0". by continuing ,you agree to our teams of Services.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey),),
            
            SizedBox(height: h*0.06,),
           ElevatedButton.icon(onPressed: (){
            if(loginprovider.keyform.currentState!.validate()){
            setState(() {
              loginprovider.loading=true;
            });
            Future.delayed(Duration(seconds: 3),(){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottonnavi()));
            });
            
            }
           },
           style: ElevatedButton.styleFrom(fixedSize: Size(370, 55),backgroundColor: Easyridecolors.elevatedbotton,
           shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),elevation: 6),
          
           icon:loginprovider.loading?Center(child: CircularProgressIndicator(color: Easyridecolors.circulerindicater,),):
            Icon(Icons.login,size: 30,color: Colors.white,), label:Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),) ),
           SizedBox(height: h*0.02,),
              Text('6 Digit code will be send to your phone in a few seconds.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey),),
               SizedBox(height: h*0.02,),
               Row(
                 children: [
                   Text('Don`t have an Account? ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                   
                   TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Singupscreen()));
                   },
                    child: Text('SignUp',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),),)
               
                 ],
               ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}