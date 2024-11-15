import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Para manejar el tipo de archivo
import 'dart:html' as html; // Solo para web
import 'menu_widget.dart'; // Importar el Drawer personalizado
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class CrearIncidenciaScreen extends StatefulWidget {
  const CrearIncidenciaScreen({super.key});

  @override
  _CrearIncidenciaScreenState createState() => _CrearIncidenciaScreenState();
}

class _CrearIncidenciaScreenState extends State<CrearIncidenciaScreen> {
  String _nombreUsuario = '';
  String? _sucursal;
  String? _tipoIncidencia;
  html.File? _selectedWebImage; // Para manejar archivos en Flutter Web
  bool _isLoading = false;
  final TextEditingController _descripcionController = TextEditingController();
  List<dynamic> _sucursales = [];
  List<dynamic> _tiposIncidencias = [];

  @override
  void initState() {
    super.initState();
     _loadNombreUsuario();
    _fetchSucursales();
    _fetchTiposIncidencias();
  }

//Obtener el nombre del usuario
  Future<void> _loadNombreUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nombreUsuario = prefs.getString('nombre') ?? 'Usuario';
    });
  }

  // Método para obtener las sucursales desde la API
  Future<void> _fetchSucursales() async {
    try {
      final response = await http.get(Uri.parse('https://url503.com/demoFlutter/sucursales.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          setState(() {
            _sucursales = data['data'];
          });
        } else {
          _mostrarSnackBar(data['message'] ?? 'Error al obtener sucursales');
        }
      } else {
        _mostrarSnackBar('Error del servidor: ${response.statusCode}');
      }
    } catch (e) {
      _mostrarSnackBar('Error: $e');
    }
  }

  // Método para obtener los tipos de incidencias desde la API
  Future<void> _fetchTiposIncidencias() async {
    try {
      final response = await http.get(Uri.parse('https://url503.com/demoFlutter/tipos_incidencias.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          setState(() {
            _tiposIncidencias = data['data'];
          });
        } else {
          _mostrarSnackBar(data['message'] ?? 'Error al obtener tipos de incidencias');
        }
      } else {
        _mostrarSnackBar('Error del servidor: ${response.statusCode}');
      }
    } catch (e) {
      _mostrarSnackBar('Error: $e');
    }
  }

  // Método para mostrar SnackBars con mensajes
  void _mostrarSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  // Método para crear una incidencia con imagen
  Future<void> _crearIncidencia() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse("https://url503.com/demoFlutter/incidencias.php");
      final request = http.MultipartRequest('POST', url);

      // Añadir campos al request
      request.fields['descripcion'] = _descripcionController.text;
      request.fields['sucursal'] = _sucursal ?? '';
      request.fields['tipo_incidencia'] = _tipoIncidencia ?? '';

      // Añadir la imagen si está seleccionada
      if (_selectedWebImage != null) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(_selectedWebImage!);
        await reader.onLoad.first;

        final fileBytes = reader.result as List<int>;
        request.files.add(http.MultipartFile.fromBytes(
          'foto',
          fileBytes,
          filename: _selectedWebImage!.name,
          contentType: MediaType('image', 'jpeg'), // Ajusta el tipo según sea necesario
        ));
      }

      // Enviar el request
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      print('Response status: ${response.statusCode}');
      print('Response body: ${responseData.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(responseData.body);
        if (data['success']) {
          _mostrarSnackBar('Incidencia registrada exitosamente');
          _limpiarFormulario();
        } else {
          _mostrarSnackBar(data['message'] ?? 'Error al registrar la incidencia');
        }
      } else {
        _mostrarSnackBar('Error del servidor: ${response.statusCode}');
      }
    } catch (e) {
      _mostrarSnackBar('Error: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  // Método para limpiar el formulario después de una subida exitosa
  void _limpiarFormulario() {
    setState(() {
      _sucursal = null;
      _tipoIncidencia = null;
      _selectedWebImage = null;
      _descripcionController.clear();
    });
  }

  // Método para seleccionar una imagen en Flutter Web
  Future<void> _pickImage() async {
    if (kIsWeb) {
      // Código específico para Flutter Web
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final files = uploadInput.files;
        if (files!.isNotEmpty) {
          setState(() {
            _selectedWebImage = files[0];
          });
          print('Imagen seleccionada: ${_selectedWebImage!.name}');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF204563),
        title: Text(_nombreUsuario),
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
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Registrar incidencia',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              // Campo "Sucursal"
DropdownButtonFormField<String>(
  value: _sucursal,
  decoration: const InputDecoration(
    labelText: 'Sucursal',
    border: OutlineInputBorder(),
  ),
  onChanged: (String? newValue) {
    setState(() {
      _sucursal = newValue;
    });
  },
  items: _sucursales.map<DropdownMenuItem<String>>((sucursal) {
    return DropdownMenuItem<String>(
      value: sucursal['nombre_sucursal'], // Usar nombre en lugar del ID
      child: Text(sucursal['nombre_sucursal']),
    );
  }).toList(),
),
              const SizedBox(height: 20),

              // Campo "Tipo de incidencia"
              DropdownButtonFormField<String>(
  value: _tipoIncidencia,
  decoration: const InputDecoration(
    labelText: 'Tipo de incidencia',
    border: OutlineInputBorder(),
  ),
  onChanged: (String? newValue) {
    setState(() {
      _tipoIncidencia = newValue;
    });
  },
  items: _tiposIncidencias.map<DropdownMenuItem<String>>((tipo) {
    return DropdownMenuItem<String>(
      value: tipo['nombre_tipo'], // Usar nombre en lugar del ID
      child: Text(tipo['nombre_tipo']),
    );
  }).toList(),
),
              const SizedBox(height: 20),

              // Campo "Descripción"
              TextField(
                controller: _descripcionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),

              // Botón para seleccionar imagen
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image),
                label: const Text('Seleccionar Imagen'),
              ),
              const SizedBox(height: 10),

              // Mostrar el nombre de la imagen seleccionada
              _selectedWebImage != null
                  ? Text('Imagen seleccionada: ${_selectedWebImage!.name}')
                  : Text('No se ha seleccionado ninguna imagen'),
              const SizedBox(height: 30),

              // Botones "Cancelar" y "Registrar"
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey, // Color del botón "Cancelar"
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: const Size(130, 50), // Tamaño del botón
                          ),
                          onPressed: () {
                            // Acción para cancelar: limpiar el formulario
                            _limpiarFormulario();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(username: _nombreUsuario,),
                              ),
                            );
                          },
                          child: const Text('Cancelar'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF204563), // Color del botón "Registrar"
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: const Size(130, 50), // Tamaño del botón
                          ),
                          onPressed: _crearIncidencia, // Llama a la función para registrar
                          child: const Text('Registrar'),
                        ),
                      ],
                    ),
              const SizedBox(height: 30),

              // Footer con enlace
              TextButton(
                onPressed: () {
                  // Acción para reportar problemas técnicos
                },
                child: const Text.rich(
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
