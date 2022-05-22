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
  int _selectedMarStatue = 0;
  var marStatues = <String>['Evli', 'Bekar'];

  //Job
  int _selectedJob = 0;
  var jobs = <String>[
    'Öğrenci',
    'Çalışmıyor',
    'Memur',
    'Ev hanımı',
    'Öğretmen'
  ];

  //Sex
  int _selectedSex = 0;
  var sexes = <String>['Erkek', 'Kadın'];

  @override
  Widget build(BuildContext context) {
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
          DropdownButton<String>(
            hint: Text('Medeni durumunuzu seçiniz'),
            // Initial Value
            value: _selectedMarStatue == null
                ? null
                : marStatues[_selectedMarStatue],

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: marStatues.map((String items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (newValue) {
              setState(() {
                _selectedMarStatue = marStatues.indexOf(newValue!);
              });
            },
          ),

          //Job dropdown
          DropdownButton<String>(
            hint: Text('Medeni durumunuzu seçiniz'),
            // Initial Value
            value: _selectedJob == null ? null : jobs[_selectedJob],

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: jobs.map((String items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (newValue) {
              setState(() {
                _selectedJob = jobs.indexOf(newValue!);
              });
            },
          ),

          //Sex dropdown
          DropdownButton<String>(
            hint: Text('Medeni durumunuzu seçiniz'),
            // Initial Value
            value: _selectedSex == null ? null : sexes[_selectedSex],

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: sexes.map((String items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (newValue) {
              setState(() {
                _selectedSex = sexes.indexOf(newValue!);
              });
            },
          ),

          AddUser(
            user.uid,
            _firstNameController.text.trim(),
            user.email,
            marStatues[_selectedMarStatue],
            jobs[_selectedJob],
            sexes[_selectedSex],
          ),
          Text(
              'Profilinizi daha sonra profili düzenle \nkısmından düzenleyebilirsiniz.')
        ],
      ),
    );
  }
}
