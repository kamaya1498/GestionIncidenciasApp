import 'package:flutter/material.dart';
import 'crear_incidencia.dart';  // Importar el archivo para la pantalla de Crear Incidencia
import 'reporte.dart';          // Importar el archivo para la pantalla de Reporte
import 'perfil.dart';           // Importar el archivo para la pantalla de Perfil
import 'main.dart';
import 'home.dart';             // Importar el archivo para redirigir al login (main)

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100, // Altura reducida para el DrawerHeader
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,  // Color de fondo para el DrawerHeader
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Registro de incidencias',  // Mostrar el nombre del usuario
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),  // Botón de cerrar con icono 'X'
                      onPressed: () {
                        Navigator.pop(context);  // Cierra el Drawer
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);  // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),  // Redirige a la pantalla Home
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text('Crear Incidencia'),
            onTap: () {
              Navigator.pop(context);  // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrearIncidenciaScreen()),  // Redirige a la pantalla Crear Incidencia
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Ver Reporte'),
            onTap: () {
              Navigator.pop(context);  // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReporteScreen()),  // Redirige a la pantalla Reporte
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context);  // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilScreen()),  // Redirige a la pantalla Perfil
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.pop(context);  // Cierra el drawer
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),  // Redirige a la pantalla Main (Login)
                (Route<dynamic> route) => false,  // Elimina todas las rutas anteriores para evitar volver
              );
            },
          ),
        ],
      ),
    );
  }
}
