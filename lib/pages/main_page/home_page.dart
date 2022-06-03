import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';
import 'package:fortuneteller/pages/navbar_pages/homepage/nav_home.dart';
import 'package:fortuneteller/pages/navbar_pages/nav_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  static const List<Widget> _titles = <Widget>[
    Text(
      'Falmatik',
      style: TextStyle(
        color: Color(TEXT_COLOR),
      ),
    ),
    Text(
      'Gelen kutusu',
      style: TextStyle(
        color: Color(TEXT_COLOR),
      ),
    ),
    Text(
      'Profil',
      style: TextStyle(
        color: Color(TEXT_COLOR),
      ),
    ),
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(BACKGROUND_COLOR),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _titles.elementAt(_selectedIndex),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          // Home Tab

          NavHomePage(),

          // Inbox Tab

          Center(
            child: Text('Inbox'),
          ),

          // Profile Tab

          NavProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_sharp),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(BUTTON_COLOR),
        onTap: onTapped,
      ),
    );
  }
}
