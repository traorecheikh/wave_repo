import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});
  @override
  State<StatefulWidget> createState() => _SendScreen();
}

class _SendScreen extends State<SendScreen> {
  List<Contact> filteredContacts = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    if (await FlutterContacts.requestPermission()) {
      setState(() {
        isLoading = !isLoading;
      });
      filteredContacts =
          await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        isLoading = !isLoading;
      });
    }
    setState(() {
      filteredContacts = filteredContacts.where((contact) {
        if (contact.phones.isEmpty) {
          return false;
        } //des SELECT
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
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text("Send Money"),
          centerTitle: true,
          pinned: true,
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(spacing: 20, children: [
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
            SizedBox(height: 0)
          ]),
        )),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          Contact c = filteredContacts[index];
          return ContactItems(
            name: c.displayName.toString(),
            number: c.phones.first.normalizedNumber.toString(),
          );
        }, childCount: filteredContacts.length)),
      ]),
    );
  }
}

class ContactItems extends StatelessWidget {
  String name = "";
  String number = "";
  ContactItems({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.grey),
            child: Icon(Icons.person, color: Colors.grey.shade700),
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
