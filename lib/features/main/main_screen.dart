import 'package:flutter/material.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/features/main/components/bottom_bar.dart';
import 'package:football_app/features/main/matches/matches_screen.dart';
import 'package:football_app/features/main/news/news_screen.dart';
import 'package:football_app/features/main/puzzle/puzzle_screen.dart';
import 'package:football_app/features/main/settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  final pages = [
    const MatchesScreen(),
    const PuzzleScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff003266),
      body: Column(
        children: [
          pages[currentPage].expanded(),
          BottomBar(
            currentPage: currentPage,
            onPageChanged: (p0) {
              setState(() {
                currentPage = p0;
              });
            },
          )
        ],
      ),
    );
  }
}
