import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';

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
              children: [
                Text('Hoşgeldin, ${user.email}'),
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Color(BUTTON_COLOR),
                          textStyle: TextStyle(
                            color: Color(BUTTON_TEXT_COLOR),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          minimumSize: Size(200, 50)),
                      onPressed: () {
                        //TODO: when clicked go to camera
                      },
                      child: Text(
                        'Kahve Falı',
                        style: TextStyle(
                          color: Color(BUTTON_TEXT_COLOR),
                        ),
                      ),
                    ),
                  ],
                ),
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
