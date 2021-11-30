import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimotest/ui/login_ui.dart';
import 'package:rimotest/ui/main/dashboard_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Rimo Tech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: LoginUI(),
        routes: {
          '/dashboard': (context) => DashboardUI(),
        });
  }
}
