import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/widgets/paciente_list.dart';
import 'package:google_fonts/google_fonts.dart';

class Busqueda extends StatefulWidget {
  const Busqueda({super.key});

  @override
  State<Busqueda> createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  final List<UserData> userList = [
    UserData('JANETH ALEJANDRA MORALES MENDOZA', 4.6),
    UserData('Hola que tallll  2', 3.8),
    UserData('Usuario 3', 5.0),
    // Agrega más datos de usuarios aquí...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 254, 254),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            leading: IconButton(
              icon: const Icon(Icons.navigate_before_rounded,
                  size: 43, color: Color.fromRGBO(20, 148, 164, 1)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              " Psicólogos",
              style: GoogleFonts.getFont(
                'Work Sans',
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(102, 109, 149, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return PsicologoList(
                          userData: userList[index],
                        );
                      },
                    ),
                    // child: Center(
                    //   child: Text('Contenido de la pantalla'),
                    // ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class UserData {
  final String name;
  final double rating;

  UserData(this.name, this.rating);
}
