import 'package:flutter/material.dart';
import 'menu_widget.dart';  // Importar el Drawer personalizado

class ReporteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF204563), // Color azul oscuro del AppBar
        title: Text('Reporte de incidencias'),
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                // Ejemplo de tarjetas para cada incidencia
                IncidenciaCard(
                  titulo: 'Título',
                  descripcion: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ubicacion: 'Sucursal',
                  fecha: '01/11/2019',
                ),
                IncidenciaCard(
                  titulo: 'Título',
                  descripcion: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ubicacion: 'Sucursal',
                  fecha: '01/11/2019',
                ),
                IncidenciaCard(
                  titulo: 'Título',
                  descripcion: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ubicacion: 'Sucursal',
                  fecha: '01/11/2019',
                ),
              ],
            ),
          ),
          
          // Botón "Volver"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Funcionalidad de volver atrás
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF204563),  // Azul oscuro
                foregroundColor: Colors.white,  // Color del texto blanco
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados
                ),
                minimumSize: Size(double.infinity, 50), // Tamaño ancho y alto del botón
              ),
              child: const Text('Volver'),
            ),
          ),

          // Texto de problemas técnicos
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextButton(
              onPressed: () {
                // Acción al presionar "Reportelo."
              },
              child: Text.rich(
                TextSpan(
                  text: '¿Tiene problemas técnicos? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Repórtelo.',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IncidenciaCard extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String ubicacion;
  final String fecha;

  const IncidenciaCard({
    required this.titulo,
    required this.descripcion,
    required this.ubicacion,
    required this.fecha,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  ubicacion,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                fecha,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
