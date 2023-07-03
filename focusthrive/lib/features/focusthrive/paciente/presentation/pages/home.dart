import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  int _selectedIndex = 0;


  

  void _onNavItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  // Navegar a la ruta correspondiente según el índice seleccionado
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/buscar');
        break;
      case 2:
        Navigator.pushNamed(context, '/perfil');
        break;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                height: 150,
                child: Center(
                  child: Text(
                    "Hola Miguel",
                    style: GoogleFonts.getFont('Work Sans',
                        textStyle: const TextStyle(
                            fontSize: 35,
                            color: Color.fromRGBO(102, 109, 149, 1),
                            fontWeight: FontWeight.w300)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(46, 167, 217, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/clock.svg', // Ruta del archivo SVG del icono de GIF
                          width:
                              40, // Ajusta el tamaño del icono según tus necesidades
                          height: 40, color: Colors.white70,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(16, 170, 130, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.task,
                        size: 40,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 150,
                height: 40,
                child: Center(
                  child: Text(
                    "Tareas",
                    style: GoogleFonts.getFont('Work Sans',
                        textStyle: const TextStyle(
                            fontSize: 35,
                            color: Color.fromRGBO(102, 109, 149, 1),
                            fontWeight: FontWeight.w300)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  SizedBox(
                    width: 300,
                    height: 80,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("Pendientes",style: GoogleFonts.getFont('Work Sans',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(102, 109, 149, 1),
                          fontWeight: FontWeight.w600)),
                    textAlign: TextAlign.center,
                  ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  Color.fromRGBO(246, 35, 35, 0.89),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  SizedBox(
                    width: 300,
                    height: 80,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("Por Hacer",style: GoogleFonts.getFont('Work Sans',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(102, 109, 149, 1),
                          fontWeight: FontWeight.w600)),
                    textAlign: TextAlign.center,
                  ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  Color.fromRGBO(46, 167, 217, 1),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), 
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  width: 300,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("Terminadas",style: GoogleFonts.getFont('Work Sans',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(102, 109, 149, 1),
                          fontWeight: FontWeight.w600)),
                    textAlign: TextAlign.center,
                  ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromRGBO(16, 170, 130, 1),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children:[ BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            
          ],
        ),]
      ),
      
    );
  }

  
}


//  Navigator.push(context,
//                             MaterialPageRoute(builder: (context) =>  PremiumSubscriptionView()));