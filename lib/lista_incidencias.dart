// lib/lista_incidencias.dart

import 'package:flutter/material.dart';

class ListaIncidencias extends StatelessWidget {
  const ListaIncidencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Incidencias'),
        automaticallyImplyLeading: false, // Oculta el botón de regresar automático del AppBar
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // Ejemplo de tarjetas para cada incidencia
          IncidenciaCard(
            titulo: 'Título',
            descripcion: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ubicacion: 'San Salvador',
            fecha: '01/11/2019',
          ),
          IncidenciaCard(
            titulo: 'Título',
            descripcion: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ubicacion: 'San Salvador',
            fecha: '01/11/2019',
          ),
          IncidenciaCard(
            titulo: 'Título',
            descripcion: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ubicacion: 'San Salvador',
            fecha: '01/11/2019',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Funcionalidad de volver atrás
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300], // Color de fondo
            foregroundColor: Colors.black, // Color del texto
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
            ),
          ),
          child: const Text('Volver'),
        ),
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
      child: ListTile(
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(descripcion),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ubicacion),
                Text(fecha),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Acción al presionar el botón de opciones (actualmente sin acción)
          },
        ),
      ),
    );
  }
}
