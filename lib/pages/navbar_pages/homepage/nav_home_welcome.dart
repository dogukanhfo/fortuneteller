import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';
import 'package:fortuneteller/pages/navbar_pages/profilepage/create_profile.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Column(
            children: [
              Text('Profilinizi oluşturduktan sonra fal bakabiliriz'),
              Icon(Icons.arrow_drop_down),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateProfilePage(),
                    ),
                  );
                },
                child: Text('Profil Oluştur'),
              ),
            ],
          );
        }
        var userDocument = snapshot.data!;
        return Column(
          children: [
            Text('Hoşgeldin ${userDocument.get('firstName')}'),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(200, 50)),
              onPressed: () {
                //TODO: when clicked go to camera
              },
              child: Text(
                'Kahve Falı',
              ),
            ),
          ],
        );
      },
    );

    //if (checkIfDocExists('users') == true) {
    //  return ElevatedButton(
    //    onPressed: () {
    //      Navigator.push(
    //        context,
    //        MaterialPageRoute(
    //          builder: (context) => const CreateProfilePage(),
    //        ),
    //      );
    //    },
    //    child: Text('Profil Oluştur'),
    //  );
    //}
    //return Text('Hoşgeldin ${collect.firstName}');
  }
}
