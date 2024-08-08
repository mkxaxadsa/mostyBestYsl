// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_app/core/constants/app_icons.dart';

import 'package:football_app/core/constants/app_puzzles.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class DetailPuzzleScreen extends StatefulWidget {
  const DetailPuzzleScreen({
    super.key,
    required this.puzzle,
  });
  final PuzzleData puzzle;
  @override
  State<DetailPuzzleScreen> createState() => _DetailPuzzleScreenState();
}

class _DetailPuzzleScreenState extends State<DetailPuzzleScreen> {
  late final List<String> initialData;
  List<String> data = [];
  @override
  void initState() {
    initialData = List<String>.from(widget.puzzle.parts);
    data = List<String>.from(widget.puzzle.parts)..shuffle();

    super.initState();
  }

  void checkStatus() {
    for (int i = 0; i < data.length; i++) {
      if (data[i] != initialData[i]) {
        return;
      }
      if (i == data.length - 1) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("You Win!")));
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.puzzle.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(.8),
            ),
          ),
          Positioned.fill(
            child: SizedBox(
              width: double.maxFinite,
              child: SafeArea(
                child: Column(
                  children: [
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
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
            
                      child: ReorderableGridView.count(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            final element = data.removeAt(oldIndex);
                            data.insert(newIndex, element);
                          });
                          checkStatus();
                        },
                        footer: const [],
                        children: data
                            .map(
                              (e) => Image.asset(
                                e,
                                key: ValueKey(e),
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
