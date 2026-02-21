import 'package:easytextride/EasyRideColors/easyridecolors.dart';
import 'package:easytextride/homepages/homescreen.dart';
import 'package:easytextride/menu/menuscreen.dart';
import 'package:easytextride/payement/paymentscreen.dart';
import 'package:easytextride/qrpages/qrscreen.dart';
import 'package:easytextride/support/supportscreen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Bottonnavi extends StatefulWidget {
  const Bottonnavi({super.key});

  @override
  State<Bottonnavi> createState() => _BottonnaviState();
}

class _BottonnaviState extends State<Bottonnavi> {
  List<Widget> pages = [ 
      Homescreen(),
      Paymentscreen(),
      Qrscreen(),
      Menuscreen(),
      NeedHelp()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        activeColor: Easyridecolors.elevatedbotton,
        color: Colors.grey,
        initialActiveIndex: 0,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.account_balance_wallet, title: 'Payments'),
          TabItem(icon: Icons.qr_code_scanner),
          TabItem(icon: Icons.menu, title: 'Menu'),
          TabItem(icon: Icons.help_outline, title: 'Support'),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          print('Active index: $index');
          //UPDATE REALTIME USER WALLET BALANCE API CALL
          // if (index == 1) {
          //   Provider.of<WalletProvider>(context, listen: false)
          //       .fetchWalletHistory(context);
          // }
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}