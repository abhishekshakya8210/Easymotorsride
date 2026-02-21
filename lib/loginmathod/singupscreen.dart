import 'package:easytextride/EasyRideColors/easyridecolors.dart';
import 'package:easytextride/botton/bottonnavi.dart';
import 'package:easytextride/loginmathod/loginscreen.dart';
import 'package:easytextride/loginmathod/mainloginscreen.dart';
import 'package:easytextride/providerwithloginandsignup/signupprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Singupscreen extends StatefulWidget {
  const Singupscreen({super.key});

  @override
  State<Singupscreen> createState() => _SingupscreenState();
}

class _SingupscreenState extends State<Singupscreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final signupprovider =  Provider.of<Signupprovider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,))
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Form(
              key: signupprovider.keyabhi,
              child: Column(children: [
                 
                  Image(image: AssetImage('assets/splashabhi.png',),),
                  SizedBox(
                    height: h*0.02,),
                    TextFormField(
                      controller: signupprovider.fullnamacontroller,
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return 'please enter your name';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'full name',
                        prefixIcon: Icon(Icons.person,size: 30,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                    SizedBox(height: h*0.02,),
                     SizedBox(
                    height: h*0.02,),
                    TextFormField(
                      controller: signupprovider.emailcontroller,
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return 'please enter your email';
                        }else if(!value.contains('@gmail.com')){
                          return 'enter your valid email ';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: ' email',
                        prefixIcon: Icon(Icons.email,size: 30,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                  SizedBox(
                    height: h*0.02,),
                     IntlPhoneField(
                        controller:signupprovider.mobilecontroller,
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
               // SizedBox(height: h*0.02,),
                Text('Enter your phone number without "0". by continuing ,you agree to our teams of Services.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black),),
                 SizedBox(height: h*0.02,),
                 ListTile(
                  leading: Checkbox(
                  value: signupprovider.check, onChanged: (value){
                  setState(() {
                    signupprovider.check=value!;
                  });
                 },
                 ),
              title: Text('I agree to Terms and Contdition',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                 ),
              SizedBox(height: h*0.02,),
             ElevatedButton.icon(onPressed: ()async{
              if(signupprovider.keyabhi.currentState!.validate()){
                if(signupprovider.check==null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Easyridecolors.elevatedbotton,
                    content: 
                  Text('fill the checkbox'),
                  ));
                   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString("fullname", signupprovider.fullnamacontroller.text);
              sharedPreferences.setString("email", signupprovider.emailcontroller.text);
              sharedPreferences.setString("mobile", signupprovider.mobilecontroller.text);
               setState(() {
                signupprovider.loadingvalue=true;
              });
              Future.delayed(Duration(seconds: 3),(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottonnavi()));
              });
             
                }
                  
                
             
              }
             },
             style: ElevatedButton.styleFrom(fixedSize: Size(370, 55),backgroundColor: Easyridecolors.elevatedbotton,
             shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),elevation: 6),
            
             icon:signupprovider.loadingvalue?Center(child: CircularProgressIndicator(color: Easyridecolors.circulerindicater,),):
              Icon(Icons.sign_language,size: 30,color: Colors.white,), label:Text('SignUp',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),) ),
             SizedBox(height: h*0.02,),
              //SizedBox(height: h*0.02,),
                Text('6 Digit code will be send to your phone in a few seconds.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey),),
                //  SizedBox(height: h*0.02,),
                  Row(
                 children: [
                   Text('Already have an Account? ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                   
                   TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mainloginscreen()));
                   },
                    child: Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),)
               
                 ],
               ),
              SizedBox(height: h*0.01,),
              ],),
            )),
          ),
        ),
      ),
    );
  }
}