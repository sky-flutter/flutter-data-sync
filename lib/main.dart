import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/home/home_page.dart';
import 'package:flutter_app/src/services/db/hive_service.dart';
import 'package:flutter_app/src/theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService.instance.setAdapter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MyColors.colorPrimary,
      ),
      home: HomePage(),
    );
  }
}
