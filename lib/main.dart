import 'package:flutter/material.dart';
import 'home.dart';             // Importar el archivo para redirigir al login (main)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Incidencias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),  // Pantalla inicial
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí hacemos la redirección a la pantalla Home
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),  // Redirigir a HomeScreen
                  );
                },
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,  // Cambia el color del texto a blanco (#ffffff)
                    fontWeight: FontWeight.bold,  // Texto en negrita
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 32, 69, 99),  // Color de fondo del botón
                  minimumSize: Size(double.infinity, 50),  // El botón ocupa todo el ancho
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,  // El footer ocupa todo el ancho de la pantalla
                color: Color(0xFFE2E2E2),  // Fondo tipo footer en color #E2E2E2
                padding: EdgeInsets.all(15.0),  // Padding de 15px en todos los lados
                child: GestureDetector(
                  onTap: () {
                    // Acción para recuperar contraseña
                  },
                  child: Text(
                    '¿Olvidó su contraseña? Recupérela.',
                    style: TextStyle(
                      color: Colors.black87,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,  // Texto centrado
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}