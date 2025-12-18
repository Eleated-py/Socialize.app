

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:mobile_proyects/main.dart';
import 'LoginPage.dart';



Color lightGray = Color(0xFFD3D3D3);



void _changeColor(BuildContext context, light_gray) {
        Color lightGray = Color.fromARGB(255, 134, 134, 134);
    }




class WelcomePage extends StatelessWidget {
    const WelcomePage({super.key});


    



    Future<void> _goToLogin(BuildContext context) async {
        final prefs = await SharedPreferences.getInstance();         //abrir almacenamiento
        await prefs.setBool('isFirstTime', false);                 //guardar que ya no es la primera vez

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            
            
            body: Stack(
                children: [
                    Container(                                                        
                        decoration: const BoxDecoration(
                            image: DecorationImage(                                         // Fondo con imagen
                                image: AssetImage('assets/images/fondo_motiv.jpg'),
                                fit: BoxFit.cover,
                                ),
                            ),
                        ),
                    Align(
                        alignment: Alignment(0.7, 0.35), // Desplazado a la derecha, centrado vertical
                        child: ElevatedButton(
                                        onPressed: () {
                                            _goToLogin(context);
                                        },
                                        child: Text('Presionar'),
                                        style: ButtonStyle(
                                        
                                                    ),
                                ),
                    ),
                ],
            ),

        );
    }
}
