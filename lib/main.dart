
//// flutter run
//// flutter pub get
//// flutter clean


import 'package:flutter/material.dart';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_proyects/auth.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'pages/LoginPage.dart';
import 'pages/WelcomePage.dart';
import 'pages/HomeScreen.dart';
import 'pages/LoadingPage.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();         // Flutter listo?
    await Firebase.initializeApp(                           //Inicio Firebase
        options: DefaultFirebaseOptions.currentPlatform,  // Configuración específica para Android, iOS, etc.
    );


    final prefs = await SharedPreferences.getInstance();
    bool isFirstTime;
    bool ? valor = prefs.getBool('isFirstTime');

    if (valor == null) {
        isFirstTime = true;                                //same as --->>  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    }
    else {
        isFirstTime = false;
    }    




    runApp(AuthLayout(showWelcome: isFirstTime));
}

class AuthLayout extends StatelessWidget {
    final bool showWelcome;
    final User? user = FirebaseAuth.instance.currentUser;
    AuthLayout({super.key, required this.showWelcome});




    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ValueListenableBuilder(
        valueListenable: authService,
        builder: (context, authService, child) {
          return StreamBuilder(
            stream: authService.authStateChanges,
            builder: (context, snapshot) {
              Widget widget;
              
              if (snapshot.connectionState == ConnectionState.waiting) {
                widget = LoadingPage();
              } 
              else if (snapshot.hasData) {
                widget = const HomeScreen();
              }
              else if (showWelcome) {
                widget = WelcomePage();
              }
              else {
                widget = LoginPage();
              }
              return widget;
            }
          );
        }
      ),
    );              
  }
}





