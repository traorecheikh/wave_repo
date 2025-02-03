import 'package:flutter/material.dart';

import '../models/Transactions.dart';
import 'dashboard_screen.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchState();
}

List<Transactions> FilteredList = Transaction().TransactionList;

class SearchState extends State<Search> {
  String text = "";
  bool isActive = false;
  bool isTransfers = false;

  void searchElement(String text) {
    setState(() {
      FilteredList = Transaction().TransactionList;

      if (isActive) {
        FilteredList = FilteredList.where((transaction) {
          final matchesText =
              transaction.nom.toLowerCase().contains(text.toLowerCase());
          if (isTransfers) {
            return matchesText &&
                transaction.typeTransaction == TypeTransaction.transfert;
          } else {
            return matchesText &&
                transaction.typeTransaction != TypeTransaction.transfert;
          }
        }).toList();
      } else {
        FilteredList = Transaction().TransactionList.where((t) {
          return t.nom.contains(text);
        }).toList();
      }
    });
  }

  void toggleFilter(bool transfers) {
    setState(() {
      if (isActive && isTransfers == transfers) {
        isActive = false;
      } else {
        isActive = true;
        isTransfers = transfers;
      }
      searchElement(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.99),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey.withOpacity(.11),
        title: Text(
          "Transactions",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(.11),
            child: Column(
              children: [
                Container(
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.11),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        text = value;
                      });
                      searchElement(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: TextStyle(height: 0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => toggleFilter(true),
                      child: FilterOption(
                        mytext: "Transfers",
                        myicon: Icons.person,
                        isActive: isActive && isTransfers,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => toggleFilter(false),
                      child: FilterOption(
                        mytext: "Bills",
                        myicon: Icons.lightbulb,
                        isActive: isActive && !isTransfers,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: FilteredList.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      itemCount: FilteredList.length,
                      itemBuilder: (context, index) {
                        return FilteredList[index];
                      },
                    )
                  : Center(child: Text("Aucune recherche trouvée")),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String mytext;
  final IconData myicon;
  final bool isActive;

  const FilterOption({
    super.key,
    required this.myicon,
    required this.mytext,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10, top: 10),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.grey.shade900.withAlpha(155)
            : Colors.grey.withAlpha(80),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(myicon, color: isActive ? Colors.white : Colors.black),
          SizedBox(width: 4),
          Text(
            mytext,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
