import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortuneteller/pages/coffe_fortune_page/static_image/static.dart';
import 'package:fortuneteller/services/firestore_addcomment.dart';
import 'package:image_picker/image_picker.dart';

class CoffeFortunePage extends StatefulWidget {
  const CoffeFortunePage({Key? key}) : super(key: key);

  @override
  State<CoffeFortunePage> createState() => _CoffeFortunePageState();
}

class _CoffeFortunePageState extends State<CoffeFortunePage> {
  final user = FirebaseAuth.instance.currentUser!;

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(56),
          primary: Colors.white,
          onPrimary: Colors.black,
          textStyle: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
        child: Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            buildButton(
              title: 'Galeriden seç',
              icon: Icons.image_outlined,
              onClicked: () => pickImage(ImageSource.gallery),
            ),
            const SizedBox(height: 24),
            buildButton(
              title: 'Kamera',
              icon: Icons.camera_alt_outlined,
              onClicked: () => pickImage(ImageSource.camera),
            ),
            const SizedBox(height: 24),
            image != null
                ? Column(
                    children: [
                      Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                      AddComment(
                        userId: user.uid,
                        comment: 'Merhaba dogukan, blablabla',
                        readStatus: 'Okunmamış falınız var...',
                      )
                    ],
                  )
                : FlutterLogo(size: 64),
            ButtonTheme(
              minWidth: 170,
              child: RaisedButton(
                child: Text("Detect in Image"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StaticImage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
