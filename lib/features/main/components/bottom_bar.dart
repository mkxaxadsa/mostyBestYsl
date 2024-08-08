// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:football_app/core/constants/app_icons.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/mediaquery_ext_on_context.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentPage,
    required this.onPageChanged,
  });
  final int currentPage;
  final void Function(int) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 55 + context.padding.bottom,
      decoration: const BoxDecoration(
        color: Color(0xff003061),
        border: Border(
          top: BorderSide(width: 1, color: Color(0x14FAFAFA)),
        ),
      ),
      child: Row(
        children: [
          _item(icon: AppIcons.matches, label: "Matches", index: 0),
          _item(icon: AppIcons.puzzle, label: "Puzzles", index: 1),
          _item(icon: AppIcons.news, label: "News", index: 2),
          _item(icon: AppIcons.settings, label: "Settings", index: 3),
        ],
      ),
    );
  }

  Widget _item({
    required String icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        onPageChanged(index);
      },
      child: Container(
        height: 47,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: 24,
              fit: BoxFit.fitHeight,
              color: index == currentPage
                  ? const Color(0xFFFB5500)
                  : const Color(0xFFFAFAFA).withOpacity(.14),
            ).paddingOnly(bottom: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: index == currentPage
                    ? const Color(0xFFFB5500)
                    : const Color(0xFFFAFAFA).withOpacity(.14),
                fontSize: 10,
                fontFamily: 'SF UI Display',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    ).expanded();
  }
}
