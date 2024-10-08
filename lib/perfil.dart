import 'package:flutter/material.dart';
import 'menu_widget.dart';  // Importar el Drawer personalizado

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: const Color.fromARGB(255, 32, 69, 99),
        foregroundColor: Colors.white,
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
      // ignore: prefer_const_constructors
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(20))
              ],
            ),

            // - first row with profile picture and username -
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // profile picture
                Container(
                  alignment: Alignment.center,// use aligment
                  child: Image.asset(
                    'assets/perfil_default.png',
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),

                // username
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Usuario', textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('NombreUsuario', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal))
                    ],
                  ),
                ),
              ],
            ),

            // - second row with user info -
            Row(
              children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre', textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('Juan Alejandro puentes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal))
                    ],
                  ),
                ),
              ],
            ),

            // - third row with user info
            Row(
              children: [
              Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tipo de usuario', textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('Operador', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal))
                    ],
                  ),
                ),
              ],
            ),

            // Pop out button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () { Navigator.pop(context); },
                  // child: const Text("Volver", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),)
                  child: Text('Volver', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold,),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 32, 69, 99),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: Color(0xFFE2E2E2),
        padding: EdgeInsets.all(15.0),
        child: GestureDetector(
          child: Text(
            '¿Tiene algún problema técnico? Reportelo',
            style: TextStyle(
              color: Colors.black87,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,  // Texto centrado
          ),
        ),
      ),
    );
  }
}
