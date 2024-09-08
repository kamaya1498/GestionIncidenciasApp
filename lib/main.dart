import 'package:flutter/material.dart';
import 'registro_incidencias.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Incidencias',
      home: HomeScreen(),);

    
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
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => const RegistroIncidencias() ),
            );
          },
          child: const Text('Registrar Incidencias'),
        ),
      ),
    );
  }
}