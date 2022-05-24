import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';
import 'package:fortuneteller/pages/navbar_pages/homepage/nav_home_welcome.dart';

class NavHomePage extends StatefulWidget {
  const NavHomePage({Key? key}) : super(key: key);

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                WelcomeWidget(),
                SizedBox(
                  height: 300,
                ),
                Text('blabla'),
                SizedBox(
                  height: 300,
                ),
                Text('blabla'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
