import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String query = "";
  List<OptionFacture> filtered = [];
  void Search(String query) {
    if (query == "") {
      filtered = factureOption;
    } else {
      filtered = factureOption.where((f) {
        return f.titre.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    Search(query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 15,
            children: [
              TextField(
                onChanged: (value) => Search(value),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "Search by name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              Row(
                spacing: 7,
                children: [
                  OptionPayment(Icons.lightbulb, "Factures", Colors.yellow),
                  OptionPayment(
                      Icons.emoji_food_beverage, "Restauration", Colors.red),
                  OptionPayment(Icons.shopping_bag, "Shopping", Colors.blue),
                  OptionPayment(
                      Icons.beach_access_outlined, "Tourisme", Colors.purple),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Factures",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  )
                ],
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return filtered[index];
                },
                shrinkWrap: true,
                itemCount: filtered.length,
              )
            ],
          ),
        ));
  }
}

class OptionPayment extends StatelessWidget {
  late IconData iconData;
  late String data1;

  late Color mycolor;

  OptionPayment(this.iconData, this.data1, this.mycolor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 35,
          color: mycolor,
        ),
        Text(data1)
      ],
    );
  }
}

class OptionFacture extends StatelessWidget {
  String image = "";
  String titre = "";

  OptionFacture(this.image, this.titre);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        spacing: 15,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("assets/images/factures/${image}.png"),
                    fit: BoxFit.cover)),
          ),
          Text(
            titre,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}

List<OptionFacture> factureOption = [
  OptionFacture("canal", "Canal+"),
  OptionFacture("senelec", "Senelec"),
  OptionFacture("rapido", "Rapido"),
  OptionFacture("seneau", "Seneau"),
  OptionFacture("woyofal", "Woyofal"),
];
