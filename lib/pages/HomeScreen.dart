




import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_proyects/main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_proyects/main.dart';
import 'LoginPage.dart';
import 'SettingsPage.dart';
import 'package:mobile_proyects/pages/SettingsPage.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


const Color background = Color.fromARGB(255, 241, 237, 228);


class _HomeScreenState extends State<HomeScreen> {



  void goToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }
  void quit() {
    Navigator.pop(context);
  }



    //// buildAppBar function:

  PreferredSizeWidget buildAppBar(BuildContext context) {
      return AppBar(
                  title: Text(
                      " ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                  backgroundColor: background,
                  elevation: 0,
                  centerTitle: true,
                  leading: SizedBox(
                          height: 30,
                          width: 30,
                          child : ElevatedButton(
                              onPressed: () {
                              quit(); // Exits the app
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: background,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(5),
                                  elevation : 0,
                              ), // Button style
                              child: Image.asset(
                                  "assets/images/arrow.png",
                                  height: 40,
                                  width: 30,
                                  fit: BoxFit.contain,
                              ),
                          ),
                      ),
                  actions: [
                      GestureDetector(
                          onTap: () {
                                goToSettings();                                                            // Action when the icon is tapped
                          },
                          child: Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(0)
                              ),
                          child: Image.asset(
                                  "assets/images/settingsRed.png",
                                  height: 50,
                                  width: 50,
                                  )
                          ),
                          
                      ),
                  ],
          );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: background,
              image: DecorationImage(
                image: AssetImage('assets/images/fondoGeneral.jpg'),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                
              ],
            )
          )
        ],
      )
    );


    
  }
}



















