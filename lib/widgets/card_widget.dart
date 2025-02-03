import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../screens/camera_screen.dart';

class MyCard extends StatelessWidget {
  final double? height;
  double? width;
  final bool isClickable;

  MyCard(this.height, this.width, this.isClickable);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isClickable) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QrCamera(),
              ));
        }
      },
      child: Center(
        child: Container(
          height: this.height,
          width: width ?? 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  colorFilter: ColorFilter.mode(Colors.blue, BlendMode.darken),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: width != null ? 200 : 140,
              width: width != null ? 200 : 140,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: width != null ? 180 : 100,
                    width: width != null ? 180 : 100,
                    child: PrettyQrView(
                        qrImage: QrImage(QrCode.fromData(
                            data: "I love my wife ouly",
                            errorCorrectLevel: 0))),
                  ),
                  width != null
                      ? SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 15,
                            ),
                            Text(
                              "Scan",
                            )
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
