import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final String id;
  final String? firstName;
  final String? email;
  final String? maritalStatus;
  final String? job;
  final String? sex;

  const AddUser(this.id, this.firstName, this.email, this.maritalStatus,
      this.job, this.sex,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() async {
      return await users
          .doc(id)
          .set({
            'firstName': firstName,
            'email': email,
            'maritalStatus': maritalStatus,
            'job': job,
            'sex': sex,
          })
          .then((value) => Navigator.pop(context))
          .catchError((error) => print('Failed to add user: $error'));
    }

    return ElevatedButton(
      onPressed: addUser,
      child: Text('Tamamla'),
    );
  }
}
