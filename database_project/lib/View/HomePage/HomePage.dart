import 'package:database_project/Common/DubleTapExitWidget.dart';
import 'package:database_project/Style/color_schemes.g.dart';
import 'package:database_project/View/BottomNavBar/BottomNavBar.dart';
import 'package:database_project/View/CustomBottomNavBar.dart';
import 'package:database_project/View/HomePage/MusicChart.dart';
import 'package:flutter/material.dart';

import 'package:logger/logger.dart';

import 'CustomSearchBar.dart';
import 'Recommended.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DoubleTapExitWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CustomSearchBar(),
                    Recommended(),
                    MusicChart(),
                  ],
                ),
              ),
              BottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
