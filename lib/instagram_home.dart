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
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 40),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined, size: 40),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined, size: 40),
              label: 'Likes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 40),
              label: 'Profile',
            ),
          ],
        ));
  }
}
