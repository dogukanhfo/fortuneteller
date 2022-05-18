import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 0;

  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Center(
            child: Text('HomePage'),
          ),
          Center(
            child: Text('Inbox'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Giriş yapılan email ${user.email}'),
              MaterialButton(
                enableFeedback: false,
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Color(BUTTON_COLOR),
                child: Text(
                  'Çıkış yap',
                  style: TextStyle(
                    color: Color(BUTTON_TEXT_COLOR),
                  ),
                ),
              ),
            ],
          ),
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
