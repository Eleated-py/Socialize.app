
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Puedes cambiar el color de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí va tu imagen
            Image.asset(
              "assets/loading.png", // 👈 cambia esto por tu imagen
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // Animación de carga
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
