// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:football_app/app/global_navigator/global_navigator.dart';

import 'package:football_app/core/constants/app_icons.dart';
import 'package:football_app/core/constants/app_images.dart';
import 'package:football_app/core/constants/app_puzzles.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/mediaquery_ext_on_context.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:football_app/features/main/puzzle/detail_puzzle/detail_puzzle_screen.dart';

class StartPuzzleScreen extends StatefulWidget {
  const StartPuzzleScreen({
    Key? key,
    required this.puzzle,
  }) : super(key: key);
  final PuzzleData puzzle;
  @override
  State<StartPuzzleScreen> createState() => _StartPuzzleScreenState();
}

class _StartPuzzleScreenState extends State<StartPuzzleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff003266),
      body: SizedBox(
        width: double.maxFinite,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 192,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppImages.detailPuzzleHeader,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            AppIcons.arrowLeft,
                            width: 24,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Puzzles',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'SF UI Display',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.puzzle.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0x66FAFAFA),
                                fontFamily: 'SF UI Display',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ).expanded(),
                        const SizedBox(
                          width: 24,
                        ),
                      ],
                    ).paddingSymetric(horizontal: 8),
                  ).paddingOnly(top: context.padding.top),
                ],
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 11.3,
                crossAxisSpacing: 11.3,
              ),
              itemCount: widget.puzzle.parts.length,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.puzzle.parts[index],
                  fit: BoxFit.cover,
                );
              },
            ),
            GestureDetector(
              onTap: () {
                GlobalNavigator.push(context, page: DetailPuzzleScreen(puzzle: widget.puzzle));
              },
              child: Container(
                width: double.maxFinite,
                height: 48,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFB5500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Shuffle',
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ).paddingOnly(bottom: 8).paddingSymetric(horizontal: 16),
            const Text(
              'When you press the Shuffle button, the game will start.',
              style: TextStyle(
                color: Color(0x66FAFAFA),
                fontSize: 16,
                fontFamily: 'SF UI Display',
                fontWeight: FontWeight.w500,
              ),
            ).paddingOnly(bottom: 16).paddingSymetric(horizontal: 16)
          ],
        ),
      ),
    );
  }
}
