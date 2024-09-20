import 'package:flutter/material.dart';
import 'menu_widget.dart';  // Importar el Drawer personalizado

class ReporteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();  // Abre el menú de hamburguesa
              },
            );
          },
        ),
      ),
      drawer: CustomDrawer(),  // Usar el widget Drawer personalizado
      body: Center(
        child: Text('Bienvenido a la pantalla de reporte'),
      ),
    );
  }
}
