import '../screens/dashboard_screen.dart';

class Transaction {
  List<Transactions> TransactionList = [
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 2, hours: 4, minutes: 30)),
      fluxTransaction: FluxTransaction.entrant,
      typeTransaction: TypeTransaction.transfert,
      money: "5000",
      nom: "Moussa Diop",
      numero: "77 234 56 78",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 3, hours: 5, minutes: 15)),
      fluxTransaction: FluxTransaction.sortant,
      typeTransaction: TypeTransaction.transfert,
      money: "3000",
      nom: "Fatou Ndiaye",
      numero: "78 345 67 89",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 5, hours: 8, minutes: 45)),
      typeTransaction: TypeTransaction.Depot,
      money: "2000",
      nom: "Depot", // Set to type name (Depot)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 6, hours: 10, minutes: 0)),
      typeTransaction: TypeTransaction.retrait,
      money: "1500",
      nom: "retrait",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 4, hours: 2, minutes: 30)),
      typeTransaction: TypeTransaction.operation,
      numero: "77 123 45 67",
      money: "2500",
      nom: "operation", // Set to type name (operation)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 7, hours: 11, minutes: 15)),
      typeTransaction: TypeTransaction.operation,
      nom: "Ouly Spa Symphony",
      money: "1000",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 1, hours: 20, minutes: 0)),
      fluxTransaction: FluxTransaction.entrant,
      typeTransaction: TypeTransaction.transfert,
      money: "6000",
      nom: "Alioune Ba",
      numero: "78 123 45 67",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 3, hours: 6, minutes: 45)),
      fluxTransaction: FluxTransaction.sortant,
      typeTransaction: TypeTransaction.transfert,
      money: "1500",
      nom: "Aissatou Sarr",
      numero: "77 987 65 43",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 4, hours: 5, minutes: 30)),
      typeTransaction: TypeTransaction.Depot,
      money: "3500",
      nom: "Depot", // Set to type name (Depot)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 2, hours: 8, minutes: 0)),
      typeTransaction: TypeTransaction.retrait,
      money: "4500",
      nom: "retrait", // Set to type name (retrait)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 6, hours: 3, minutes: 15)),
      typeTransaction: TypeTransaction.operation,
      numero: "77 654 32 10",
      money: "2200",
      nom: "operation", // Set to type name (operation)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 5, hours: 1, minutes: 45)),
      typeTransaction: TypeTransaction.operation,
      nom: "Yves Food Market",
      money: "3200",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 7, hours: 12, minutes: 30)),
      fluxTransaction: FluxTransaction.entrant,
      typeTransaction: TypeTransaction.transfert,
      money: "500",
      nom: "Seynabou Fall",
      numero: "78 290 34 56",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 4, hours: 9, minutes: 0)),
      fluxTransaction: FluxTransaction.sortant,
      typeTransaction: TypeTransaction.transfert,
      money: "1000",
      nom: "Khalil Sall",
      numero: "77 340 29 19",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 3, hours: 7, minutes: 15)),
      typeTransaction: TypeTransaction.Depot,
      money: "1500",
      nom: "Depot", // Set to type name (Depot)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 2, hours: 6, minutes: 45)),
      typeTransaction: TypeTransaction.retrait,
      money: "2100",
      nom: "retrait", // Set to type name (retrait)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 5, hours: 10, minutes: 30)),
      typeTransaction: TypeTransaction.operation,
      numero: "77 569 81 43",
      money: "2800",
      nom: "operation", // Set to type name (operation)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 4, hours: 3, minutes: 0)),
      typeTransaction: TypeTransaction.operation,
      nom: "Macky’s Cafe",
      money: "1600",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 3, hours: 13, minutes: 30)),
      fluxTransaction: FluxTransaction.entrant,
      typeTransaction: TypeTransaction.transfert,
      money: "4500",
      nom: "Cheikh Tidiane",
      numero: "78 412 34 56",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 6, hours: 15, minutes: 0)),
      fluxTransaction: FluxTransaction.sortant,
      typeTransaction: TypeTransaction.transfert,
      money: "1200",
      nom: "Penda Gaye",
      numero: "77 654 09 12",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 4, hours: 2, minutes: 30)),
      typeTransaction: TypeTransaction.Depot,
      money: "1800",
      nom: "Depot", // Set to type name (Depot)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 5, hours: 14, minutes: 0)),
      typeTransaction: TypeTransaction.retrait,
      money: "2500",
      nom: "retrait", // Set to type name (retrait)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 6, hours: 8, minutes: 30)),
      typeTransaction: TypeTransaction.operation,
      numero: "78 290 34 98",
      money: "3100",
      nom: "operation", // Set to type name (operation)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 7, hours: 9, minutes: 15)),
      typeTransaction: TypeTransaction.operation,
      nom: "Boulangerie Xo",
      money: "1200",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 3, hours: 4, minutes: 30)),
      fluxTransaction: FluxTransaction.entrant,
      typeTransaction: TypeTransaction.transfert,
      money: "7000",
      nom: "Abdoulaye Diallo",
      numero: "77 246 80 51",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 2, hours: 3, minutes: 45)),
      fluxTransaction: FluxTransaction.sortant,
      typeTransaction: TypeTransaction.transfert,
      money: "2200",
      nom: "Ousmane Cissé",
      numero: "77 498 23 09",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 1, hours: 5, minutes: 30)),
      typeTransaction: TypeTransaction.Depot,
      money: "5300",
      nom: "Depot", // Set to type name (Depot)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 7, hours: 13, minutes: 0)),
      typeTransaction: TypeTransaction.retrait,
      money: "3200",
      nom: "retrait", // Set to type name (retrait)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 4, hours: 2, minutes: 0)),
      typeTransaction: TypeTransaction.operation,
      numero: "77 512 34 56",
      money: "2000",
      nom: "operation", // Set to type name (operation)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 6, hours: 7, minutes: 15)),
      typeTransaction: TypeTransaction.operation,
      nom: "La Maison de la Mode",
      money: "500",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 5, hours: 8, minutes: 45)),
      fluxTransaction: FluxTransaction.entrant,
      typeTransaction: TypeTransaction.transfert,
      money: "4800",
      nom: "Mamadou Seck",
      numero: "78 134 25 67",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 2, hours: 4, minutes: 30)),
      fluxTransaction: FluxTransaction.sortant,
      typeTransaction: TypeTransaction.transfert,
      money: "2700",
      nom: "Mariama Ndao",
      numero: "77 267 19 43",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 1, hours: 9, minutes: 0)),
      typeTransaction: TypeTransaction.Depot,
      money: "1000",
      nom: "Depot", // Set to type name (Depot)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 6, hours: 10, minutes: 15)),
      typeTransaction: TypeTransaction.retrait,
      money: "700",
      nom: "retrait", // Set to type name (retrait)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 4, hours: 12, minutes: 0)),
      typeTransaction: TypeTransaction.operation,
      numero: "77 347 61 92",
      money: "2600",
      nom: "operation", // Set to type name (operation)
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 2, hours: 7, minutes: 45)),
      typeTransaction: TypeTransaction.operation,
      nom: "SeneBaskets",
      money: "1200",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 3, hours: 1, minutes: 30)),
      fluxTransaction: FluxTransaction.entrant,
      typeTransaction: TypeTransaction.transfert,
      money: "5600",
      nom: "Ibrahime Ndiaye",
      numero: "78 473 25 39",
    ),
    Transactions(
      Date: DateTime.now().subtract(Duration(days: 5, hours: 3, minutes: 0)),
      fluxTransaction: FluxTransaction.sortant,
      typeTransaction: TypeTransaction.transfert,
      money: "3400",
      nom: "Aminata Diagne",
      numero: "77 258 64 15",
    ),
  ];
}
