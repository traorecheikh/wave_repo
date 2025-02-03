import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Airtime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> {
  List<Contact> filteredContacts = [];
  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  void loadContacts() async {
    filteredContacts = await FlutterContacts.getContacts(withProperties: true);
    setState(() {
      filteredContacts = filteredContacts.where((contact) {
        if (contact.phones.isEmpty) {
          return false;
        }
        return contact.phones.first.normalizedNumber.startsWith("+221");
      }).map((contact) {
        contact.phones.first.normalizedNumber =
            contact.phones.first.normalizedNumber.replaceAll("+221", "");
        return contact;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Text("Airtime"),
            centerTitle: true,
            pinned: true,
          ),
          SliverPersistentHeader(pinned: true, delegate: PersistentHeader()),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            Contact c = filteredContacts[index];
            return AirtimeItems(
                name: c.displayName, number: c.phones.first.normalizedNumber);
          }, childCount: filteredContacts.length))
        ],
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  // TODO: implement maxExtent
  double get maxExtent => 160;

  @override
  // TODO: implement minExtent
  double get minExtent => 160;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        spacing: 10,
        children: [
          TextField(
            decoration: InputDecoration(
                label: Text("To"),
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
                alignLabelWithHint: true,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.blue,
                ))),
          ),
          Row(
            spacing: 7,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.add,
                    size: 35,
                    color: Colors.white,
                  )),
              Text(
                "Send to a new number",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Contacs",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class AirtimeItems extends StatelessWidget {
  final String name;
  final String number;
  const AirtimeItems({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    String operator = "";
    if (number.startsWith("78") || number.startsWith("77")) {
      operator = "orange";
    } else if (number.startsWith("76")) {
      operator = "yaas";
    } else {
      operator = "expresso";
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: AssetImage(operator == "orange"
                        ? "assets/images/operators/orange.png"
                        : operator == "expresso"
                            ? "assets/images/operators/expresso.png"
                            : "assets/images/operators/yas.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(number)
            ],
          )
        ],
      ),
    );
  }
}
