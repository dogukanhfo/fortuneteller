import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'comment_screen.dart';

class NavInboxPage extends StatefulWidget {
  const NavInboxPage({Key? key}) : super(key: key);

  @override
  State<NavInboxPage> createState() => _NavInboxPageState();
}

class _NavInboxPageState extends State<NavInboxPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('comments')
            .where('userId', isEqualTo: user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                      title: Text(doc['readStatus']),
                      subtitle: Text(doc['date']),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentScreen(doc: doc),
                          ),
                        );
                      }),
                );
              },
            );
          } else {
            return Text('error');
          }
        });
  }
}
