import 'package:flutter/material.dart';
import 'package:video_sharing_app_ui/pages/details_page.dart';
import 'package:video_sharing_app_ui/pages/home_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.dark().copyWith(),
      home: HomeTab(),
    );
  }
}
