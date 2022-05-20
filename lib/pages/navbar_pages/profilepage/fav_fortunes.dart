import 'package:flutter/material.dart';

class FavFortunesPage extends StatefulWidget {
  const FavFortunesPage({Key? key}) : super(key: key);

  @override
  State<FavFortunesPage> createState() => _FavFortunesPageState();
}

class _FavFortunesPageState extends State<FavFortunesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favori fallar'),
      ),
    );
  }
}
