import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';

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
          child: ListTile(
            title: Text('Profili düzenle'),
            leading: Icon(Icons.edit),
            trailing: Icon(Icons.arrow_forward),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Favori fallarım'),
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.arrow_forward),
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
