import 'package:flutter/material.dart';
import 'package:football_app/core/constants/app_icons.dart';
import 'package:football_app/core/extensions/align_ext_on_widget.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/mediaquery_ext_on_context.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFFFAFAFA),
            fontSize: 32,
            fontFamily: 'SF UI Display',
            fontWeight: FontWeight.w600,
          ),
        ).paddingOnly(bottom: 16, top: context.padding.top + 40),
        _item(
          text: "Share with friends",
          icon: AppIcons.share,
          onTap: () => _shareApp(context),
        ),
        _divider(),
        _item(
          text: "Support",
          icon: AppIcons.subcsriptionInfo,
          onTap: () => _openWebView('https://forms.gle/L3r3WKqk71wVMcp8A'),
        ),
        _divider(),
        _item(
          text: "Terms of use",
          icon: AppIcons.termsOfUse,
          onTap: () => _openWebView(
              'https://docs.google.com/document/d/1WU-JlbXjm3Qfkt1nHBUZDpy9XEDVaZBKvjo5s9SW0lk/edit?usp=sharing'),
        ),
        _divider(),
        _item(
          text: "Privacy Policy",
          icon: AppIcons.privacy,
          onTap: () => _openWebView(
              'https://docs.google.com/document/d/1swokWkihdOAG8Zuc9yL5jSNqtmeLvLhTM2YbqfDMSRE/edit?usp=sharing'),
        ),
        _divider(),
      ],
    ).paddingSymetric(horizontal: 16);
  }

  Future<void> _openWebView(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
    } else {
      print('Failed to open the WebView.');
    }
  }

  void _shareApp(BuildContext context) {
    Share.share(
        'Check out this great app - Mosty Best: Football Active in AppStore! Share with friends! https://apps.apple.com/app/mosty-best-football-active/id6618147198');
  }

  Widget _divider() {
    return Container(
      width: double.maxFinite,
      height: 1,
      color: const Color(0xffFAFAFA).withOpacity(.4),
    );
  }

  Widget _item({
    required String text,
    required String icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.maxFinite,
      height: 46,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Image.asset(
                icon,
                height: 21,
              ).align(Alignment.centerLeft),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 16,
                fontFamily: 'SF UI Display',
                fontWeight: FontWeight.w500,
              ),
            ).expanded(),
            Image.asset(
              AppIcons.chevronRight,
              width: 8,
            ).paddingSymetric(horizontal: 8),
          ],
        ),
      ),
    );
  }
}
