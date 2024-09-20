import 'package:flutter/material.dart';

class RegistroIncidencias extends StatefulWidget {
    const RegistroIncidencias({super.key});
  @override
  _RegistroIncidenciasState createState() => _RegistroIncidenciasState();
}

class _RegistroIncidenciasState extends State<RegistroIncidencias> {
  String? _sucursal;
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _datosAdicionalesController = TextEditingController();
  DateTime? _fecha;

  String? _categorias;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de incidencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _sucursal,
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
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _datosAdicionalesController,
              decoration: InputDecoration(labelText: 'Datos adicionales'),
            ),
            SizedBox(height: 16),
            Text('Fecha:'),
           ElevatedButton(
              child: Text(_fecha == null ? 'Seleccionar fecha' : '${_fecha?.day}/${_fecha?.month}/${_fecha?.year}'),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light(),
                      child: child!,
                    );
                  },
                ).then((DateTime? newValue) {
                  setState(() {
                    _fecha = newValue;
                  });
                });
              },
            ),
            SizedBox(height: 16),
            Text('Categorías:'),
            DropdownButton<String>(
              value: _sucursal,
              onChanged: (String? newValue) {
                setState(() {
                  _sucursal = newValue;
                });
              },
              items: <String>['soporte tecnico', 'otros', 'infraestructura']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.add_circle_outline),
              label: Text('Registrar categoría'),
              onPressed: () {
                // Llama a la función para registrar una nueva categoría
            
              },
            ),
            
          ],
        ),
      ),
    );
  }

}