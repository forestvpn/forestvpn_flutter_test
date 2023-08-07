import 'package:flutter/material.dart';

import '../presentation/list_of_news_widget.dart';
// import 'package:google_fonts/google_fonts.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          "Notifications",
          // style: GoogleFonts.jost(textStyle: ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.36,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Mark all read",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: 0.36,
              ),
            ),
            onPressed: () {
              // TODO: handle the press
            },
          )
        ],
      ),
      body: const ListOfNewsWidget(),
    );
  }
}
