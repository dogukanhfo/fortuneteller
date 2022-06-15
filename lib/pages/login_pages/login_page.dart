import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';
import 'package:fortuneteller/pages/login_pages/google_sign_in_btn.dart';
import 'package:fortuneteller/services/auth.dart';
import 'package:fortuneteller/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.coffee,
                        size: 80,
                        color: Color(TEXT_COLOR),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Falmatik',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
