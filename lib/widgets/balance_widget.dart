import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  bool isVisible = true;

  void setVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setVisibility(),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Center(
            child: Row(
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
                TextSpan(children: [
                  TextSpan(
                      text: isVisible ? "500000" : "••••••",
                      style: TextStyle(fontSize: 35)),
                  TextSpan(
                      text: isVisible ? "F" : "",
                      style: TextStyle(fontSize: 20))
                ])),
            Icon(
              !isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
