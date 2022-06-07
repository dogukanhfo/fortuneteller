import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class CommentScreen extends StatefulWidget {
  final DocumentSnapshot<Object?> doc;
  const CommentScreen({Key? key, required this.doc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommentScreenState(this.doc);
  }
}

class _CommentScreenState extends State<CommentScreen> {
  DocumentSnapshot<Object?> doc;

  _CommentScreenState(this.doc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text(
              doc['comment'],
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 18.0),
            Text(
              DateFormat('dd/MM/yyyy hh:mm')
                  .format(doc['date'].toDate())
                  .toString(),
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
