import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/action_bar.dart';

class InstagramHome extends StatefulWidget {
  const InstagramHome({super.key});

  @override
  State<InstagramHome> createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ActionBar(),
      ),
      body: const Center(
        child: Text(
          'Welcome to Instagram Clone',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
