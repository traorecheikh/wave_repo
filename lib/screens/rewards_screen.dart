import 'package:flutter/material.dart';

class Cadeau extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Cadeaux"),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                spacing: 10,
                children: [
                  Container(
                    height: 70,
                    child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Icon(
                            Icons.card_giftcard,
                            size: 25,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Text(
                            "De nouveaux cadeaux a deverouiller \n apparaitont le 3 fevrier!")
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Row(
                    children: [
                      Text(
                        "Anciens Cadeaux",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AllCadeauBox.length,
                    itemBuilder: (context, index) {
                      return AllCadeauBox[index];
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CadeauBox extends StatelessWidget {
  bool isOpen = false;
  CadeauBox({required this.isOpen});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !isOpen ? Colors.grey.shade400 : Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isOpen
              ? SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.yellow.shade100),
                      child: Text("Expire le 10 fevrier "),
                    )
                  ],
                ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: !isOpen ? Colors.grey.shade400 : Colors.white,
              image: DecorationImage(
                image: AssetImage(!isOpen
                    ? "assets/images/box/box3.png"
                    : "assets/images/box/box1.png"),
                fit: BoxFit.cover,
                colorFilter: !isOpen
                    ? ColorFilter.mode(
                        Colors.grey.shade400, BlendMode.saturation)
                    : ColorFilter.mode(Colors.transparent, BlendMode.multiply),
              ),
            ),
          ),
          isOpen
              ? Text("Vous avez gagne 50F")
              : Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Pour ouvrir :\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "Payez 1500 ou plus chez 2 marchands (0/2)")
                ]))
        ],
      ),
    );
  }
}

List<CadeauBox> AllCadeauBox = [
  CadeauBox(isOpen: false),
  CadeauBox(isOpen: false),
  CadeauBox(isOpen: false),
  CadeauBox(isOpen: true),
  CadeauBox(isOpen: true),
  CadeauBox(isOpen: true),
  CadeauBox(isOpen: true),
  CadeauBox(isOpen: true),
];
