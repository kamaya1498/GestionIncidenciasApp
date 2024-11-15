import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'menu_widget.dart'; // Importar el Drawer personalizado

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({super.key});

  @override
  _ReporteScreenState createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  List<dynamic> incidencias = [];
  bool isLoading = true;
  bool isSupervisor = false;

  @override
  void initState() {
    super.initState();
    checkUserLevel(); // Verificar el nivel del usuario
    fetchIncidencias(); // Cargar las incidencias al iniciar el widget
  }

  Future<void> checkUserLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nivel = prefs.getString('nivel');
    setState(() {
      isSupervisor = nivel == 'Supervisor';
    });
  }

  Future<void> fetchIncidencias() async {
  final url = Uri.parse('https://url503.com/demoFlutter/incidencias.php');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    if (data['success'] == true) {
      setState(() {
        // Filtrar solo las incidencias con estado "Activa"
        incidencias = data['data'].where((incidencia) => incidencia['estado'] == 'Activa').toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['message'] ?? 'Error al cargar incidencias')),
      );
    }
  } else {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error en la conexión con la API')),
    );
  }
}

Future<void> markAsResolved(String idIncidencia) async {
  final url = Uri.parse('https://url503.com/demoFlutter/incidencias.php?id=$idIncidencia');
  final response = await http.put(url, body: {
    'estado': 'Resuelta',
  });

  final Map<String, dynamic> data = json.decode(response.body);

  if (response.statusCode == 200 && data['success'] == true) {
    setState(() {
      incidencias.removeWhere((incidencia) => incidencia['id_incidencia'] == idIncidencia);
    });
    Navigator.of(context).pop(); // Cerrar el popup
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(data['message'] ?? 'Incidencia marcada como resuelta')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(data['message'] ?? 'Error al marcar como resuelta')),
    );
  }
}

  void showIncidenciaDetails(Map<String, dynamic> incidencia) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(incidencia['tipo_incidencia'] ?? 'Sin título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Descripción: ${incidencia['descripcion'] ?? 'Sin descripción'}'),
              Text('Sucursal: ${incidencia['sucursal'] ?? 'Sin sucursal'}'),
              Text('Fecha: ${incidencia['fecha'] ?? 'Sin fecha'}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
            if (isSupervisor)
              ElevatedButton(
                onPressed: () => markAsResolved(incidencia['id_incidencia']),
                child: const Text('Marcar como Resuelta'),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF204563), // Color azul oscuro del AppBar
        title: const Text('Reporte de incidencias'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre el menú de hamburguesa
              },
            );
          },
        ),
      ),
      drawer: CustomDrawer(), // Usar el widget Drawer personalizado
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Indicador de carga
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: incidencias.length,
              itemBuilder: (context, index) {
                final incidencia = incidencias[index];
                return InkWell(
                  onTap: () => showIncidenciaDetails(incidencia),
                  child: IncidenciaCard(
                    titulo: incidencia['tipo_incidencia'] ?? 'Sin título',
                    descripcion: incidencia['descripcion'] ?? 'Sin descripción',
                    ubicacion: incidencia['sucursal'] ?? 'Sin sucursal',
                    fecha: incidencia['fecha'] ?? 'Sin fecha',
                  ),
                );
              },
            ),
      // Botón "Volver"
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Funcionalidad de volver atrás
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF204563), // Azul oscuro
            foregroundColor: Colors.white, // Color del texto blanco
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Bordes redondeados
            ),
            minimumSize: const Size(double.infinity, 50), // Tamaño ancho y alto del botón
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
            const SizedBox(height: 8),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
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
