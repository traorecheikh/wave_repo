import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Settings"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                settingWidget(title: "Account", settingList: [
                  settingModel(
                      icone: Icons.safety_check_sharp,
                      text: "Add another account"),
                ]),
                settingWidget(title: "Share", settingList: [
                  settingModel(
                      icone: Icons.ios_share_outlined,
                      text: "Invite a friend to join"),
                  settingModel(
                      icone: Icons.stars_outlined, text: "Redeem a promo code"),
                ]),
                settingWidget(title: "Support", settingList: [
                  settingModel(icone: Icons.phone, text: "Contact support"),
                  settingModel(
                      icone: Icons.location_on, text: "Find nearby agents"),
                  settingModel(icone: Icons.book, text: "Checks limits"),
                ]),
                settingWidget(title: "Security", settingList: [
                  settingModel(
                      icone: Icons.phone_android,
                      text: "Your connected devices"),
                  settingModel(icone: Icons.shield, text: "Reset secret code"),
                ]),
                settingWidget(title: "", settingList: [
                  settingModel(
                      icone: Icons.login_outlined, text: "Log out (781706184)"),
                ]),
                Column(
                  children: [
                    Column(
                      children: [
                        Text("wave digital finance\n\Version: 25.1.23")
                      ],
                    ),
                    Text("Terms & Conditions | Privacy Notice"),
                    Text(
                      "\nClose my Wave account",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class settingModel {
  final IconData icone;
  final String text;
  settingModel({required this.icone, required this.text});
}

class settingWidget extends StatelessWidget {
  final String title;
  final List<settingModel> settingList;
  const settingWidget(
      {super.key, required this.title, required this.settingList});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          ...settingList.map((st) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    st.icone,
                    size: 30,
                  ),
                  Text(
                    st.text,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
