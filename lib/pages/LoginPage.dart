

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mobile_proyects/auth.dart';
import '/main.dart';
import 'HomeScreen.dart';

import 'package:mobile_proyects/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoginPage extends StatefulWidget {
    const LoginPage({super.key});
    @override
    State<LoginPage> createState() => _LoginPageState();
    
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _userController = TextEditingController();            //Crear lectores de texto de TextFields (Us. y Co.)
    final TextEditingController _passwordController = TextEditingController();
    String errorMessage = '';



    final user = FirebaseAuth.instance.currentUser;

    @override
    void dispose() {
        _userController.dispose();
        _passwordController.dispose();
        super.dispose();
    }


    void popPage() {
    Navigator.pop(context);
    }



    void goToHome() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
    }




  Future<void> uploadUserToDb() async{
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection("users").doc(user.uid)
        .set({
          'email': user.email,
          'nivelSocialize': 0,
          'puntos': 0
        }
        ) ; 
      }
    }
    catch (e) {
      print('Firestore error in Email');
    }
  }




    void register() async{
        try {
            await authService.value.createAccount(
                email: _userController.text,
                password: _passwordController.text
            );
            popPage();
            } on FirebaseAuthException catch (e) {
                setState(() { errorMessage = e.message ?? 'There is an error';
            });
            } catch (e) {
                setState(() {
                    errorMessage = 'Unexpected error: $e';
            });
        }
        // 2. Obtener el UID del usuario recién creado

        
    }

final Color lightGray = Color(0xFFD3D3D3);
static const Color background = Color.fromARGB(255, 241, 237, 228);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            
                body :Stack(
                    children: [
                                // Fondo con imagen
                        Container(
                            decoration: const BoxDecoration(
                                color: background,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/fondoLogin.jpg'),
                                    fit: BoxFit.scaleDown,
                                    ),
                                ),
                            ),
                        Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                    SizedBox(height:80),
                                    Text(
                                        "Welcome",
                                        style: TextStyle(
                                        fontSize: 28,
                                        fontFamily: "Garamond",
                                        color: Color.fromARGB(255, 148, 19, 19),
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                    
                                    Text(
                                        "To",
                                        style: TextStyle(
                                        fontSize: 26,
                                        fontFamily: "Garamond",
                                        color: Color.fromARGB(255, 148, 19, 19),
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                    Text(
                                        "Socialize",
                                        style: TextStyle(
                                        fontSize: 38,
                                        fontFamily: "Garamond",
                                        color: Color.fromARGB(255, 148, 19, 19),
                                        fontWeight: FontWeight.w900
                                        ),
                                    ),
                                    SizedBox(height:5),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        child: Text(
                                            "Email:",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                            fontSize:22,
                                            fontFamily: "Garamond",
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(255, 148, 19, 19)
                                            ),
                                            
                                            
                                        ),
                                    ),
                                    SizedBox(height:3),
                                    TextField(
                                        controller: _userController,
                                        style: TextStyle(
                                        fontFamily: "Garamond",
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal
                                        ),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromARGB(255, 207, 204, 196),
                                            contentPadding: EdgeInsets.all(20),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(18),
                                                borderSide: BorderSide.none
                                            ),
                                        
                                        ),
                                    ),
                                    SizedBox(height:30),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        child: Text(
                                            "Password:",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                    fontSize:22,
                                                    fontFamily: "Garamond",
                                                    fontWeight: FontWeight.w900,      //extra bold
                                                    color: Color.fromARGB(255, 148, 19, 19)
                                                ),
                                        ),
                                    ),
                                    SizedBox(height:5),
                                    TextField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromARGB(255, 207, 204, 196),
                                            contentPadding: EdgeInsets.all(20),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(18),
                                                borderSide: BorderSide.none
                                            ),
                                        ),
                                    ),
                                    Text(
                                      errorMessage,
                                      style: TextStyle(
                                      color: Colors.redAccent
                                      )
                                    ),
                                    Container(

                                        alignment: Alignment.center,
                                        width: 100,
                                        child: ElevatedButton(
                                                onPressed: () {
                                                register();
                                                goToHome();
                                                },                                           
                                                style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(255, 207, 204, 196),
                                                foregroundColor: Color.fromARGB(255, 153, 54, 54),
                                                ),
                                                child: Text("SAVE",
                                                    style: TextStyle(
                                                    fontFamily: "Garamond",
                                                    fontWeight: FontWeight.w900
                                                    )
                                                ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ],    
                ), 
        );
        
    }

}

