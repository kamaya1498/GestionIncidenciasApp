import 'package:flutter/material.dart';
import 'menu_widget.dart';  // Importar el Drawer personalizado

class CrearIncidenciaScreen extends StatefulWidget {
  @override
  _CrearIncidenciaScreenState createState() => _CrearIncidenciaScreenState();
}

class _CrearIncidenciaScreenState extends State<CrearIncidenciaScreen> {
  String? _sucursal;
  String? _tipoIncidencia;
  final TextEditingController _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF204563), // Color azul oscuro del AppBar
        title: Text('NombreUsuario'),
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
      ),
      drawer: CustomDrawer(),  // Heredar el Drawer
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título "Registrar Incidencia"
              Text(
                'Registrar incidencia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              
              // Campo "Sucursal"
              DropdownButtonFormField<String>(
                value: _sucursal,
                decoration: InputDecoration(
                  labelText: 'Sucursal',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _sucursal = newValue;
                  });
                },
                items: <String>['Sucursal 1', 'Sucursal 2', 'Sucursal 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              
              // Campo "Tipo de incidencia"
              DropdownButtonFormField<String>(
                value: _tipoIncidencia,
                decoration: InputDecoration(
                  labelText: 'Tipo de incidencia',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _tipoIncidencia = newValue;
                  });
                },
                items: <String>['Tipo 1', 'Tipo 2', 'Tipo 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              
              // Campo "Descripción"
              TextField(
                controller: _descripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),

              // Campo "Agregar fotografía"
              TextField(
                decoration: InputDecoration(
                  labelText: 'Agregar fotografía',
                  suffixIcon: Icon(Icons.attach_file),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              
              // Botones "Cancelar" y "Registrar"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey, // Color del botón "Cancelar"
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      minimumSize: Size(130, 50), // Tamaño del botón
                    ),
                    onPressed: () {
                      // Acción para cancelar
                    },
                    child: Text('Cancelar'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF204563), // Color del botón "Registrar"
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      minimumSize: Size(130, 50), // Tamaño del botón
                    ),
                    onPressed: () {
                      // Acción para registrar
                    },
                    child: Text('Registrar'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              
              // Footer con enlace
              TextButton(
                onPressed: () {
                  // Acción para reportar problemas técnicos
                },
                child: Text.rich(
                  TextSpan(
                    text: '¿Tiene problemas técnicos? ',
                    children: [
                      TextSpan(
                        text: 'Repórtelo.',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ],
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
