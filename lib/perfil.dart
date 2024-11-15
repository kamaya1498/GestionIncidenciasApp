import 'package:flutter/material.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'menu_widget.dart'; // Importar el Drawer personalizado

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  String? nivel;
  String? nombre;
  String? correo;
  String? foto;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nivel = prefs.getString('nivel');
      nombre = prefs.getString('nombre');
      correo = prefs.getString('correo');
      foto = prefs.getString('foto');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color.fromARGB(255, 32, 69, 99),
        foregroundColor: Colors.white,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Agregar padding para margen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto de perfil
              CircleAvatar(
                radius: 65,
                backgroundImage: foto != null && foto!.isNotEmpty
                    ? NetworkImage(foto!)
                    : const AssetImage('assets/images/perfil_default.png') as ImageProvider,
                onBackgroundImageError: (error, stackTrace) {
                  setState(() {
                    foto = null; // Para mostrar la imagen predeterminada en caso de error
                  });
                },
              ),
              const SizedBox(height: 20),

              // Nombre de usuario y correo
              Text(
                nombre ?? 'Usuario',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                correo ?? 'Correo no disponible',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Nivel del usuario
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Nivel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    nivel ?? 'Nivel no disponible',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Espacio antes del botón

              // Botón de "Volver"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 32, 69, 99),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: const Text(
                    'Volver',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: const Color(0xFFE2E2E2),
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          child: const Text(
            '¿Tiene algún problema técnico? Reportelo',
            style: TextStyle(
              color: Colors.black87,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
