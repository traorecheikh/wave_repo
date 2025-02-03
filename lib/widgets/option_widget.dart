import 'package:flutter/material.dart';
import 'package:wave_test/screens/airtime_screen.dart';
import 'package:wave_test/screens/bank_screen.dart';
import 'package:wave_test/screens/payment_screen.dart';
import 'package:wave_test/screens/rewards_screen.dart';
import 'package:wave_test/screens/send_screen.dart';

class Option_Icon extends StatelessWidget {
  late MaterialColor mycolor;
  late IconData myicon;
  late String mytext;
  Option_Icon({
    required this.mycolor,
    required this.mytext,
    required this.myicon,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: [
        GestureDetector(
          onTap: () {
            if (mytext == "Send") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendScreen(),
                  ));
            } else if (mytext == "Airtime") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Airtime(),
                  ));
            } else if (mytext == "Payment") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment(),
                  ));
            } else if (mytext == "Bank") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bank(),
                  ));
            } else if (mytext == "Rewards") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cadeau(),
                  ));
            }
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: mycolor.shade900.withOpacity(0.3)),
            child: Icon(
              myicon,
              size: 50,
              color: mycolor.shade900,
            ),
          ),
        ),
        Text(
          mytext,
          style: TextStyle(fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
