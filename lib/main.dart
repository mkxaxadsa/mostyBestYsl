import 'package:flutter/material.dart';
import 'package:football_app/app/app.dart';
import 'package:football_app/helpers/hive_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  runApp(const FootballApp());
}
