import 'package:BNB_New_UI/Widget/HomePageWidgets.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:BNB_New_UI/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kscaffoldcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              custom_widgets.HomeAppBar(),
              SizedBox(height: 20),
              custom_widgets.SearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}