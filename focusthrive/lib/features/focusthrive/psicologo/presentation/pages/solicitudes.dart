import 'package:flutter/material.dart';

class Solicitudes extends StatefulWidget {
  const Solicitudes({super.key});

  @override
  State<Solicitudes> createState() => _SolicitudesState();
}

class _SolicitudesState extends State<Solicitudes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Solicitudes")),
        elevation: 6,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 320,
              height: 100,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/image.jpeg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Arturo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(20, 148, 164, 1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'Abrir',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 320,
            height: 100,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/img/image.jpeg'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Juan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Acción al presionar el botón
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(20, 148, 164, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Text(
                    'Abrir',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Agrega más cajas aquí según sea necesario
        ],
      ),
    );
  }
}
