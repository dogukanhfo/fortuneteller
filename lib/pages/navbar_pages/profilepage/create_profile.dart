import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/services/firestore_adduser.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

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
    //Marital status dropdown

    final mSDropdown = DropdownButton(
      items: _createMarStaList(),
      hint: Text('İlişki durumu'),
      value: mSSelectedItem,
      onChanged: (String? value) => setState(
        () {
          mSSelectedItem = value ?? "";
        },
      ),
    );

    //Job dropdown

    final jobDropdown = DropdownButton(
      items: _createjobList(),
      hint: Text('Meslek'),
      value: jobSelectedItem,
      onChanged: (String? value) => setState(
        () {
          jobSelectedItem = value ?? "";
        },
      ),
    );

    //Sex dropdown

    final sexDropdown = DropdownButton(
      items: _createsexList(),
      hint: Text('Cinsiyet'),
      value: sexSelectedItem,
      onChanged: (String? value) => setState(
        () {
          sexSelectedItem = value ?? "";
        },
      ),
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
          Text(
              'Profilinizi daha sonra profili düzenle \nkısmından düzenleyebilirsiniz.')
        ],
      ),
    );
  }
}
