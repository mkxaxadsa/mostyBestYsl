import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/bottomsheets/stat_bottomsheet.dart';
import 'package:football_app/core/constants/app_images.dart';
import 'package:football_app/core/extensions/align_ext_on_widget.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/format_ext_on_datetime.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:football_app/data/apis/matches_api.dart';
import 'package:football_app/data/models/match.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  List<FootballMatch> data = [];

  Future<void> init() async {
    try {
      data = await MatchesApi().fetchMatches(DateTime.now());
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 200,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.matchesHeader,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Matches',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'SF UI Display',
                  fontWeight: FontWeight.w600,
                ),
              ).paddingAll(16),
            ],
          ),
        ),
        if (data.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 250.0),
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final match = data[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _teamInfo(
                        logo: 'assets/icons/football1.png',
                        name: match.homeTeamTitle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            match.league,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0x66FAFAFA),
                              fontFamily: 'SF UI Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingOnly(bottom: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                match.homeGoals.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFFFAFAFA),
                                  fontSize: 20,
                                  fontFamily: 'SF UI Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                '-',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0x66FAFAFA),
                                  fontSize: 20,
                                  fontFamily: 'SF UI Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ).paddingSymetric(horizontal: 8),
                              Text(
                                match.awayGoals.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFFFAFAFA),
                                  fontSize: 20,
                                  fontFamily: 'SF UI Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )
                        ],
                      ).expanded(),
                      const SizedBox(
                        width: 10,
                      ),
                      _teamInfo(
                        logo: 'assets/icons/football2.png',
                        name: match.awayTeamTitle,
                      ),
                    ],
                  ).paddingOnly(top: 16),
                  GestureDetector(
                    onTap: () {
                      showStatBottomSheet(context, match: match);
                    },
                    child: Container(
                      width: 164,
                      height: 32,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xBFFB5500)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Game stats',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFB5500),
                          fontSize: 14,
                          fontFamily: 'SF UI Display',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ).paddingOnly(top: 8, bottom: 16),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: const Color(0xff144273),
                  )
                ],
              ).paddingOnly(bottom: 16);
            },
          ),
      ],
    );
  }

  Widget _teamInfo({
    required String logo,
    required String name,
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
        Text(
          name,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    ).expanded();
  }
}
