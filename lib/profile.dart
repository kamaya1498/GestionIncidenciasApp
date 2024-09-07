import 'package:flutter/material.dart';
import 'package:flutter_gestion_incidencias/main.dart';

class UsrProfile extends StatelessWidget {
  const UsrProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text("UserName"),
        ),
      ),
      // main body with image, text and buttons
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: 
            [
              Image.asset('profile_pic_default.png', fit: BoxFit.contain,),

              const Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Usuario', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text('NombreUsuario', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal))
                ],
              ),

            ],
          ),

          const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topLeft,),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text('Nombre', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),

              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text('Juan Alejandro Puentes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ),

              Text(''), // TODO: Put a spacer here

              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text('Tipo de usuario', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),

              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text('Operador', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () { Navigator.pop(context); },
                child: const Text("Volver", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),)
                ),
              
              ElevatedButton(
                onPressed: () { Navigator.pop(context); },
                child: const Text("Editar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),)
                ),
            ],
          )
        ],
      )  
    );
  }
}
