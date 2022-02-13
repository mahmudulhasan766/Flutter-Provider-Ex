import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/pages/homepage.dart';
import 'package:provider_ex/provider/homepageprovider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider REST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider(),
        child: HomePage(),
      ),
    );
  }
}
