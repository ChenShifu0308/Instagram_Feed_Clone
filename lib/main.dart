import 'package:flutter/material.dart';
import 'package:instagram_clone/instagram_home.dart';
import 'package:instagram_clone/theme/dark_theme.dart';
import 'package:instagram_clone/theme/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'Instagram Clone',
      theme: instagramLightTheme,
      darkTheme: instagramDarkTheme,
      home: const InstagramHome(),
    );
  }
}