// lib/main.dart

import 'package:flutter/material.dart';
import 'lista_incidencias.dart'; // Importa la pantalla de lista de incidencias

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Define la pantalla principal como HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navega a la pantalla de lista de incidencias
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListaIncidencias(),
              ),
            );
          },
          child: const Text('Ver Incidencias'),
        ),
      ),
    );
  }
}
