import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wave_test/models/Transactions.dart';
import 'package:wave_test/models/option_icon.dart';
import 'package:wave_test/screens/search_screen.dart';
import 'package:wave_test/screens/settings_screen.dart';
import 'package:wave_test/screens/transaction_details_screen.dart';

import '../widgets/balance_widget.dart';
import '../widgets/card_widget.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Color.fromARGB(255, 70, 71, 211),
            expandedHeight: 100,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Balance(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromARGB(255, 70, 71, 211),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(17),
                            topRight: Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                    Positioned(child: MyCard(160, null, true)),
                    Positioned(
                      right: 70,
                      top: 100,
                      child: Image.asset(
                        "assets/images/pg.png",
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
                GridView.builder(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: 30),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Option().OptionList[index];
                  },
                  shrinkWrap: true,
                  itemCount: Option().OptionList.length,
                ),
                Divider(
                  thickness: 4,
                ),
                ListView.builder(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Transaction().TransactionList[index];
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SearchButton(),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Search(),
          )),
      child: Container(
        height: 26,
        width: 90,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 70, 71, 211).withOpacity(.2),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Color.fromARGB(255, 70, 71, 211),
            ),
            Text(
              "Search",
              style: TextStyle(
                  color: Color.fromARGB(255, 70, 71, 211),
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}

enum TypeTransaction { Depot, retrait, transfert, operation }

enum FluxTransaction { entrant, sortant }

class Transactions extends StatelessWidget {
  final DateTime Date;
  final String money;
  String? numero;
  late String nom;
  late FluxTransaction? fluxTransaction;
  final TypeTransaction typeTransaction;
  Transactions(
      {super.key,
      required this.Date,
      this.fluxTransaction,
      required this.typeTransaction,
      required this.money,
      this.numero,
      required this.nom});
  @override
  Widget build(BuildContext context) {
    String prefix = "";
    if (typeTransaction == TypeTransaction.transfert) {
      if (fluxTransaction == FluxTransaction.entrant) {
        prefix = "de";
      } else {
        prefix = "a";
      }
    } else if (typeTransaction == TypeTransaction.Depot) {
      prefix = "depot";
      nom = "";
      numero = "";
      fluxTransaction = FluxTransaction.entrant;
    } else if (typeTransaction == TypeTransaction.retrait) {
      numero = "";
      nom = "";
      prefix = "retrait";
      fluxTransaction = FluxTransaction.sortant;
    } else if (typeTransaction == TypeTransaction.operation) {
      if (numero != null) {
        prefix = "Achat de Credit pour le ";
        nom = "";
        fluxTransaction = FluxTransaction.sortant;
      } else {
        prefix = "Paiement ";
        numero = "";
        fluxTransaction = FluxTransaction.sortant;
      }
    }
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetails(
              ts: this,
            ),
          )),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$prefix $nom" + numero!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 70, 71, 211),
                  ),
                ),
                Text(Jiffy.parseFromDateTime(Date).yMMMMEEEEdjm)
              ],
            ),
            Text(
              fluxTransaction == FluxTransaction.sortant
                  ? "-$money" + "F"
                  : money + "F",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 70, 71, 211),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
