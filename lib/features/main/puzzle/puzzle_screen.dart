import 'package:flutter/material.dart';
import 'package:football_app/app/global_navigator/global_navigator.dart';
import 'package:football_app/core/constants/app_images.dart';
import 'package:football_app/core/constants/app_puzzles.dart';
import 'package:football_app/core/extensions/align_ext_on_widget.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:football_app/features/main/puzzle/detail_puzzle/detail_puzzle_screen.dart';
import 'package:football_app/features/main/puzzle/detail_puzzle/start_puzzle_screen.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 192,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.puzzlesHeader,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Puzzles',
                      style: TextStyle(
                        color: Color(0xFFFAFAFA),
                        fontSize: 32,
                        fontFamily: 'SF UI Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ).paddingOnly(bottom: 4),
                    const Text(
                      'Choose the puzzles you’re going to put together',
                      style: TextStyle(
                        color: Color(0x66FAFAFA),
                        fontSize: 16,
                        fontFamily: 'SF UI Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ).paddingAll(16),
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          shrinkWrap: true,
          primary: false,
          itemCount: AppPuzzles.puzzles.length,
          itemBuilder: (context, index) {
            final puzzle = AppPuzzles.puzzles[index];
            return GestureDetector(
              onTap: () {
                GlobalNavigator.push(context,
                    page: StartPuzzleScreen(puzzle: puzzle));
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        puzzle.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0x00111111), Color(0xFF003266)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Colors.white.withOpacity(0.25),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    puzzle.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'SF UI Display',
                    ),
                  ).paddingAll(16),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
