import 'package:assignment_four_tutedue/pages/Home.dart';
import 'package:assignment_four_tutedue/provider/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/cat_dog_provider.dart';
import 'provider/colour_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiceProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => CatDogProvider()),
      ],

      child: MaterialApp(
        title: "Assignment",
        theme: ThemeData(fontFamily: 'NotoSans'),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
