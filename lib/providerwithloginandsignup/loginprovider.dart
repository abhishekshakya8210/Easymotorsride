import 'package:flutter/material.dart';

class Loginprovider with ChangeNotifier{
  TextEditingController phonecontroller = TextEditingController();
  final keyform =  GlobalKey<FormState>();
  bool loading = false;
}