import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddComment extends StatelessWidget {
  final String userId;
  final String comment;
  final String readStatus;

  const AddComment(
      {Key? key,
      required this.userId,
      required this.comment,
      required this.readStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference comments =
        FirebaseFirestore.instance.collection('comments');

    Future<void> addComment() async {
      return await comments
          .add({
            'comment': comment,
            'date': DateTime.now(),
            'readStatus': readStatus,
            'userId': userId,
          })
          .then((value) => Navigator.pop(context))
          .catchError((error) => print('Failed to add comment => $error'));
    }

    return ElevatedButton(onPressed: addComment, child: Text('Gönder'));
  }
}
