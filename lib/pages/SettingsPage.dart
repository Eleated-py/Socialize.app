






import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_proyects/auth.dart';
import '/main.dart';
import 'HomeScreen.dart';
import 'package:mobile_proyects/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';





class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("This is the Settings screen")),
    );
  }
}
