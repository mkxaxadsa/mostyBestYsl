import 'package:flutter/material.dart';
import 'package:football_app/app/global_navigator/global_navigator.dart';
import 'package:football_app/core/constants/app_images.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:football_app/features/main/main_screen.dart';
import 'package:football_app/helpers/hive_helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.onboardingBg,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            left: 16,
            right: 16,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 8,),
                  const Text(
                    'Join the game! Everything about football in one app.',
                    style: TextStyle(
                      color: Color(0xFFFAFAFA),
                      fontSize: 32,
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ).paddingOnly(bottom: 4),
                  const Text(
                    'News, statistics - we have everything a true football fan needs!',
                    style: TextStyle(
                      color: Color(0x66FAFAFA),
                      fontSize: 16,
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Column(
                    children: [
                      const Spacer(flex: 2,),
                      GestureDetector(
                        onTap: () {
                          HiveHelper.setIsNotFirstTimeOpen();
                          GlobalNavigator.pushAndRemoveUntil(context, page: const MainScreen());
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
                            'GET',
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ).paddingOnly(bottom: 24),
                      const Text(
                        'Terms of Use / Privacy Policy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x66FAFAFA),
                          fontFamily: 'SF UI Display',
                        ),
                      ),
                      const Spacer(),
                    ],
                  ).expanded(flex: 9),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
