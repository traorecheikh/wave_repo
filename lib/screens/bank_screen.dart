import 'package:flutter/material.dart';
import 'package:wave_test/models/Transactions.dart';

class Bank extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankState();
}

class _BankState extends State<Bank> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          "Link your bank or MFI",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Fixed App Bar
          SliverAppBar(
            floating: false,
            snap: false,
            expandedHeight: 0,
            collapsedHeight: 60,
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            leading: SizedBox.shrink(),
            flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Pinned Tab Menu
          SliverPersistentHeader(
            pinned: true,
            delegate: MenuTab(),
          ),

          // Scrollable Content
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverList(
              delegate:
                  SliverChildListDelegate([...Transaction().TransactionList]),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuTab extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        spacing: 10,
        children: [
          _MyContainer(Icons.house, "Bank"),
          _MyContainer(Icons.business, "MFI"),
        ],
      ),
    );
  }

  Widget _MyContainer(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
