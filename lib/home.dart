import 'package:flutter/material.dart';
import 'menu_widget.dart'; // Importar el Drawer personalizado
import 'crear_incidencia.dart'; // Importar la pantalla de crear incidencia
import 'reporte.dart'; // Importar la pantalla de reporte

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF204563), // Color azul oscuro del AppBar
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre el menú de hamburguesa
              },
            );
          },
        ),
        title: Text('NombreUsuario'), // Título del AppBar
      ),
      drawer: CustomDrawer(), // Usar el widget Drawer personalizado
      body: Column(
        children: [
          // Texto "Bienvenido/a"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bienvenido/a',
              style: TextStyle(
                fontSize: 24, // Tamaño de la fuente
                fontWeight: FontWeight.bold, // Negrita
              ),
            ),
          ),
          // Imagen de fondo
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3, // Ajustar altura
            child: Image.asset(
              'assets/images/laptopbg.png', // Reemplazar por la ruta de tu imagen
              fit: BoxFit.cover, // Ajusta la imagen al ancho disponible
            ),
          ),
          SizedBox(height: 20), // Espacio entre la imagen y los botones
          // Botón "Registrar Incidencia"
          ElevatedButton(
            onPressed: () {
              // Navegar a la pantalla de crear incidencia
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrearIncidenciaScreen()), // Redirige a CrearIncidenciaScreen
              );
            },
            child: Text(
              'Registrar Incidencia',
              style: TextStyle(
                color: Colors.white, // Texto blanco
                fontWeight: FontWeight.bold, // Texto en negrita
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF204563), // Color de fondo azul oscuro
              minimumSize: Size(300, 50), // Ancho y alto del botón
            ),
          ),
          SizedBox(height: 10), // Espacio entre los botones
          // Botón "Reporte"
          ElevatedButton(
            onPressed: () {
              // Navegar a la pantalla de reporte
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReporteScreen()), // Redirige a ReporteScreen
              );
            },
            child: Text(
              'Reporte',
              style: TextStyle(
                color: Colors.white, // Texto blanco
                fontWeight: FontWeight.bold, // Texto en negrita
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey, // Color de fondo gris
              minimumSize: Size(300, 50), // Ancho y alto del botón
            ),
          ),
          Spacer(), // Empuja el footer hacia la parte inferior de la pantalla
          // Footer con enlace
          Container(
            width: double.infinity, // Ancho total
            color: Color(0xFFE2E2E2), // Color de fondo gris claro
            padding: EdgeInsets.all(15.0), // Espacio dentro del footer
            child: GestureDetector(
              onTap: () {
                // Acción para reporte técnico
              },
              child: Text(
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
