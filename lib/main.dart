import 'package:flutter/material.dart';
import 'lista_incidencias.dart'; // Importa la pantalla de lista de incidencias

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Define la pantalla principal como HomeScreen
    );
  }
}


class LoginScreen extends StatelessWidget {
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