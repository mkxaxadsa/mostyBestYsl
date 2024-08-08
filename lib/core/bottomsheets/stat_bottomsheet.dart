// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/constants/app_icons.dart';
import 'package:football_app/core/constants/app_images.dart';
import 'package:football_app/core/constants/months.dart';
import 'package:football_app/core/constants/weekdays.dart';
import 'package:football_app/core/extensions/align_ext_on_widget.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';

import 'package:football_app/data/models/match.dart';

Future<void> showStatBottomSheet(
  BuildContext context, {
  required FootballMatch match,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return StatBotomSheet(match: match);
    },
  );
}

class StatBotomSheet extends StatelessWidget {
  const StatBotomSheet({
    Key? key,
    required this.match,
  }) : super(key: key);
  final FootballMatch match;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: const Color(0xff003266),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 192,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppImages.gameStatHeader,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    children: [
                      Container(
                        width: 36,
                        height: 5,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.50),
                          ),
                        ),
                      ).paddingOnly(top: 6, bottom: 3),
                      Row(
                        children: [
                          const SizedBox(
                            width: 27,
                          ),
                          const Text(
                            'Game stats',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 16,
                              fontFamily: 'SF UI Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ).align().expanded(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              AppIcons.close,
                              width: 27,
                              height: 27,
                            ),
                          )
                        ],
                      ).paddingSymetric(horizontal: 16),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _teamInfo(
                            logo: 'assets/icons/football1.png',
                            name: match.homeTeamTitle,
                            contentAlignment: Alignment.topRight,
                          ),
                          const Text(
                            'vs',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'SF UI Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingSymetric(horizontal: 8).paddingOnly(top: 30),
                          _teamInfo(
                            logo: 'assets/icons/football2.png',
                            name: match.awayTeamTitle,
                            contentAlignment: Alignment.topLeft,
                          ),
                        ],
                      ).paddingOnly(bottom: 16),
                    ],
                  ),
                ),
              ],
            ),
          ).paddingOnly(bottom: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0x14FAFAFA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Season series',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0x23FAFAFA),
                        fontFamily: 'SF UI Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ).paddingOnly(bottom: 9),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          match.homeTeamTitle,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ).expanded(),
                        Text(
                          '${match.homeGoals}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ).paddingOnly(left: 4),
                      ],
                    ).paddingOnly(bottom: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          match.awayTeamTitle,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ).expanded(),
                        Text(
                          '${match.awayGoals}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ).paddingOnly(bottom: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0x14FAFAFA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          match.homeTeamTitle,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ).paddingOnly(bottom: 4),
                        Text(
                          match.awayTeamTitle,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ).expanded(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '1st',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0x23FAFAFA),
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0x66FAFAFA),
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ).paddingOnly(top: 8, bottom: 4),
                        const Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0x66FAFAFA),
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ).paddingOnly(right: 16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '2st',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0x23FAFAFA),
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${match.homeGoals}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ).paddingOnly(top: 8, bottom: 4),
                        Text(
                          '${match.awayGoals}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ).paddingOnly(right: 16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Total',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${match.homeGoals}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ).paddingOnly(top: 8, bottom: 4),
                        Text(
                          '${match.awayGoals}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0x66FAFAFA),
                            fontSize: 16,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ).paddingOnly(bottom: 8),
              Row(
                children: [
                  Text(
                    '${weekdays[match.time.weekday - 1]} ${match.time.day} ${months[match.time.month - 1]} ${match.time.year}',
                    style: const TextStyle(
                      color: Color(0x23FAFAFA),
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ).expanded(),
                  Text(
                    '${match.time.hour.toString().padLeft(2, "0")}:${match.time.minute.toString().padLeft(2, "0")}',
                    style: const TextStyle(
                      color: Color(0x23FAFAFA),
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kategoria Superiore',
                    style: TextStyle(
                      color: Color(0x66FAFAFA),
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ).expanded(),
                  const Text(
                    'Tirana, Albania',
                    style: TextStyle(
                      color: Color(0x23FAFAFA),
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 20),
            ],
          ).paddingSymetric(horizontal: 16)
        ],
      ),
    );
  }

  Widget _teamInfo({
    required String logo,
    required String name,
    required Alignment contentAlignment,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            logo,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ).paddingOnly(bottom: 10),
        SizedBox(
          width: 100,
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ).align(contentAlignment).expanded();
  }
}
