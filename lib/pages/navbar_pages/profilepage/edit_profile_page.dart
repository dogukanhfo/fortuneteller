import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/services/firestore_adduser.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  DocumentSnapshot? snapshot;

  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get(); //get the data
    snapshot = data;
  }

  final _firstNameController = TextEditingController();

  //Maritial status
  final maritalStatusList = ['İlişkisi var', 'İlişkisi yok'];
  List<DropdownMenuItem<String>> _createMarStaList() {
    return maritalStatusList
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }

  String? mSSelectedItem;

  //Job
  final jobList = ['Öğrenci', 'Çalışmıyor', 'Memur', 'Ev hanımı', 'Öğretmen'];
  List<DropdownMenuItem<String>> _createjobList() {
    return jobList
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }

  String? jobSelectedItem;

  //Sex
  final sexList = ['Erkek', 'Kadın'];
  List<DropdownMenuItem<String>> _createsexList() {
    return sexList
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }

  String? sexSelectedItem;

  @override
  Widget build(BuildContext context) {
    //read document property from firebase
    Future<DocumentSnapshot> getData() async {
      String? _email = (await user).email;
      var a = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: _email)
          .get();

      return a.docs[0];
    }

    //Marital status dropdown

    final mSDropdown = FutureBuilder<DocumentSnapshot>(
      future: getData(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return DropdownButton(
          items: _createMarStaList(),
          hint: Text(snapshot.data!['maritalStatus']),
          value: mSSelectedItem,
          onChanged: (String? value) => setState(
            () {
              mSSelectedItem = value ?? "";
            },
          ),
        );
      },
    );

    //Job dropdown

    final jobDropdown = FutureBuilder<DocumentSnapshot>(
      future: getData(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return DropdownButton(
          items: _createjobList(),
          hint: Text(snapshot.data!['job']),
          value: jobSelectedItem,
          onChanged: (String? value) => setState(
            () {
              jobSelectedItem = value ?? "";
            },
          ),
        );
      },
    );

    //Sex dropdown

    final sexDropdown = FutureBuilder<DocumentSnapshot>(
      future: getData(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return DropdownButton(
          items: _createsexList(),
          hint: Text(snapshot.data!['sex']),
          value: sexSelectedItem,
          onChanged: (String? value) => setState(
            () {
              sexSelectedItem = value ?? "";
            },
          ),
        );
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profili düzenle'),
          Text(
            'Email: ${user.email}',
            style: TextStyle(fontSize: 18),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Container(
                width: 230.0,
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                    hintText: 'İsim',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),

          //Maritial status dropdown
          mSDropdown,

          //Job dropdown
          jobDropdown,

          //Sex dropdown
          sexDropdown,

          AddUser(
            user.uid,
            _firstNameController.text.trim(),
            user.email,
            mSSelectedItem,
            jobSelectedItem,
            sexSelectedItem,
          ),
        ],
      ),
    );
  }
}
