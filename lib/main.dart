import 'package:flutter/material.dart';
import 'home.dart'; // Importar el archivo para redirigir al login (main)

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
      home: LoginScreen(), // Pantalla inicial
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Imagen sin espacios alrededor
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4, // Ajusta el tamaño según la altura de la pantalla
            child: Image.asset(
              'assets/images/logo.png', // Cambia por tu ruta de imagen correcta
              fit: BoxFit.cover, // Ajusta la imagen para que cubra toda el área sin espacios
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Campo de Email
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Campo de Contraseña
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botón de Iniciar sesión
                  ElevatedButton(
                    onPressed: () {
                      // Aquí hacemos la redirección a la pantalla Home
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()), // Redirigir a HomeScreen
                      );
                    },
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.white, // Cambia el color del texto a blanco (#ffffff)
                        fontWeight: FontWeight.bold, // Texto en negrita
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 32, 69, 99), // Color de fondo del botón
                      minimumSize: Size(double.infinity, 50), // El botón ocupa todo el ancho
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer sin espacio a los lados ni abajo
          Container(
            width: double.infinity, // El footer ocupa todo el ancho de la pantalla
            color: Color(0xFFE2E2E2), // Fondo tipo footer en color #E2E2E2
            padding: EdgeInsets.all(15.0), // Padding de 15px en todos los lados
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
                textAlign: TextAlign.center, // Texto centrado
              ),
            ),
          ),
        ],
      ),
    );
  }
}
