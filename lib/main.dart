import 'package:flutter/material.dart';
import 'profile.dart';

const primaryColor = Color.fromARGB(255, 207, 207, 207);

void main() => runApp(
  MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    primaryColor: primaryColor,
   ),
    initialRoute: '/',
    routes: {
     '/': (context) => HomeScreen(),
      '/profile': (context) => UsrProfile(),
    },
  ),
);

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Text('User profile'),
          ),
        ),
      ),
    );
  }
}

