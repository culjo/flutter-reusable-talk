import 'package:flutter/material.dart';
import 'package:resuable_components_talk/ui/screens/home/home_screen.dart';
import 'package:resuable_components_talk/ui/views/theme/AppTheme.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Dive',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }

}
