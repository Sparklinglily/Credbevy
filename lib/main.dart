import 'package:credbevy/core/constants/dependency_injection/locator.dart';
import 'package:credbevy/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigatorKey,
      home: const HomePage(),
    );
  }
}
