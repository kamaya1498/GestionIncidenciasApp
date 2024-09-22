import 'package:flutter/material.dart';
import 'menu_widget.dart';  // Importar el Drawer personalizado


class CrearIncidenciaScreen extends StatefulWidget {
  @override
  _RegistroIncidenciasState createState() => _RegistroIncidenciasState();
}

class _RegistroIncidenciasState extends State<CrearIncidenciaScreen> {
  String? _sucursal;
  String? _tipoIncidencia;
  DateTime? _fecha;
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _datosAdicionalesController = TextEditingController();

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 400, // Define un ancho máximo para el formulario
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Sombra hacia abajo
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Registrar incidencia',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _sucursal,
                    decoration: InputDecoration(
                      labelText: 'Sucursal',
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
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _tipoIncidencia,
                    decoration: InputDecoration(
                      labelText: 'Tipo de incidencia',
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
                  SizedBox(height: 16),
                  TextField(
                    controller: _descripcionController,
                    decoration: InputDecoration(labelText: 'Descripción'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _datosAdicionalesController,
                    decoration: InputDecoration(
                      labelText: 'Agregar fotografía',
                      suffixIcon: Icon(Icons.attach_file),
                    ),
                  ),
                   SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _tipoIncidencia,
                    decoration: InputDecoration(
                      labelText: 'Categoria',
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _tipoIncidencia = newValue;
                      });
                    },
                    items: <String>['1', '2', ' 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // Color del botón "Cancelar"
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        onPressed: () {
                          // Acción para cancelar
                        },
                        child: Text('Cancelar'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Color del botón "Registrar"
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        onPressed: () {
                          // Acción para registrar
                        },
                        child: Text('Registrar'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
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
        ),
      ),
    );
  }
}
