import 'package:flutter/material.dart';
import 'package:wave_test/widgets/option_widget.dart';

class Option {
  List<Option_Icon> OptionList = [
    Option_Icon(mycolor: Colors.blue, mytext: "Send", myicon: Icons.person),
    Option_Icon(
        mycolor: Colors.orange,
        mytext: "Payment",
        myicon: Icons.shopping_basket),
    Option_Icon(
        mycolor: Colors.lightBlue,
        mytext: "Airtime",
        myicon: Icons.phone_android_outlined),
    Option_Icon(mycolor: Colors.red, mytext: "Bank", myicon: Icons.home),
    Option_Icon(
        mycolor: Colors.lightGreen,
        mytext: "Rewards",
        myicon: Icons.card_giftcard),
    Option_Icon(
        mycolor: Colors.yellow,
        mytext: "Transport",
        myicon: Icons.directions_bus_outlined),
  ];
}
