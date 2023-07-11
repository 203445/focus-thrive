import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePs extends StatefulWidget {
  const HomePs({super.key});

  @override
  State<HomePs> createState() => _HomeState();
}

class _HomeState extends State<HomePs> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Parte superior: Avatar y texto
          Container(
            width: screenWidth,
            color: Colors.blue,
            child: Container(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/img/image.jpeg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Usuario',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Parte inferior: Contenido y barra de navegación
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Contenido
                  Expanded(
                    child: Center(
                      child: Text(
                        'Contenido',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Barra de navegación
                  Container(
                    height: 60,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {
                            // Acción al presionar el ícono de inicio
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Acción al presionar el ícono de búsqueda
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            // Acción al presionar el ícono de ajustes
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




//  Navigator.push(context,
//                             MaterialPageRoute(builder: (context) =>  PremiumSubscriptionView()));