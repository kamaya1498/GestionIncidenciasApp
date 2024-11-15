import 'package:flutter/material.dart';
import 'menu_widget.dart'; // Importar el Drawer personalizado
import 'crear_incidencia.dart'; // Importar la pantalla de crear incidencia
import 'reporte.dart'; // Importar la pantalla de reporte
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu_widget.dart';
import 'crear_incidencia.dart';
import 'reporte.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userLevel;

  @override
  void initState() {
    super.initState();
    _loadUserLevel();
  }

  Future<void> _loadUserLevel() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userLevel = prefs.getString('nivel') ?? 'Desconocido';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF204563),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(widget.username),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bienvenido/a, ${widget.username}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (userLevel != null) // Muestra el nivel del usuario si está disponible
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nivel de usuario: $userLevel',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          // Imagen de fondo
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3, // Ajustar altura
            child: Image.asset(
              'assets/images/laptopbg.png', // Reemplazar por la ruta de tu imagen
              fit: BoxFit.cover, // Ajusta la imagen al ancho disponible
            ),
          ),
          const SizedBox(height: 20), // Espacio entre la imagen y los botones
          // Botón "Registrar Incidencia"
          ElevatedButton(
            onPressed: () {
              // Navegar a la pantalla de crear incidencia
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrearIncidenciaScreen()), // Redirige a CrearIncidenciaScreen
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF204563), // Color de fondo azul oscuro
              minimumSize: const Size(300, 50), // Ancho y alto del botón
            ),
            child: Text(
              'Registrar Incidencia',
              style: TextStyle(
                color: Colors.white, // Texto blanco
                fontWeight: FontWeight.bold, // Texto en negrita
              ),
            ),
          ),
          const SizedBox(height: 10), // Espacio entre los botones
          // Botón "Reporte"
          ElevatedButton(
            onPressed: () {
              // Navegar a la pantalla de reporte
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReporteScreen()), // Redirige a ReporteScreen
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey, // Color de fondo gris
              minimumSize: const Size(300, 50), // Ancho y alto del botón
            ),
            child: Text(
              'Reporte',
              style: TextStyle(
                color: Colors.white, // Texto blanco
                fontWeight: FontWeight.bold, // Texto en negrita
              ),
            ),
          ),
          const Spacer(), // Empuja el footer hacia la parte inferior de la pantalla
          // Footer con enlace
          Container(
            width: double.infinity, // Ancho total
            color: const Color(0xFFE2E2E2), // Color de fondo gris claro
            padding: const EdgeInsets.all(15.0), // Espacio dentro del footer
            child: GestureDetector(
              onTap: () {
                // Acción para reporte técnico
              },
              child: const Text(
                '¿Tiene problemas técnicos? Repórtelo.',
                style: TextStyle(
                  color: Colors.black87, // Texto negro
                  decoration: TextDecoration.underline, // Subrayado
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
