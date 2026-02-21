import 'package:flutter/material.dart';

class Signupprovider with ChangeNotifier{
    TextEditingController mobilecontroller = TextEditingController();
    TextEditingController fullnamacontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
  final keyabhi =  GlobalKey<FormState>();
  bool loadingvalue = false;
  bool check = false;
}