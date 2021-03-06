import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';
import 'package:fortuneteller/nav_animation/nav_animation.dart';
import 'package:fortuneteller/pages/navbar_pages/profilepage/create_profile.dart';
import 'package:fortuneteller/pages/navbar_pages/profilepage/fav_fortunes.dart';

import 'profilepage/edit_profile_page.dart';

class NavProfilePage extends StatefulWidget {
  const NavProfilePage({Key? key}) : super(key: key);

  @override
  State<NavProfilePage> createState() => _NavProfilePageState();
}

class _NavProfilePageState extends State<NavProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 70),
      children: <Widget>[
        Card(
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return ListTile(
                  title: Text('Profili oluştur'),
                  leading: Icon(Icons.create),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(
                      createRoute(
                        CreateProfilePage(),
                      ),
                    );
                  },
                );
              }
              return ListTile(
                title: Text('Profili düzenle'),
                leading: Icon(Icons.edit),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(
                    createRoute(
                      EditProfilePage(),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Favori fallarım'),
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                createRoute(
                  FavFortunesPage(),
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Çıkış yap'),
            leading: Icon(Icons.exit_to_app),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ),
      ],
    );
  }
}
