import 'package:flutter/material.dart';
import 'package:sidangonline/menu_bar_page.dart';

void main() => runApp(const MyApp());
var ip = "--"; //LOKALHOST NYA DIMASUKAN SINI

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Shoppers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: menu_bar_page_(),
    );
  }
}
