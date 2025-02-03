import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class TransactionDetails extends StatelessWidget {
  final Transactions ts;
  const TransactionDetails({super.key, required this.ts});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(ts.nom),
      ),
    );
  }
}
