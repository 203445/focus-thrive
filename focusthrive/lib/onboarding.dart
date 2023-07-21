import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  double _progressWidth = 25.0; // Ancho inicial de la barra de progreso

  List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: "Paso 1",
      description: "Dale un impulso a tu bienestar emocional.",
      imagePath: "assets/img/157.jpg",
      gradientColors: [
        Color.fromARGB(255, 33, 149, 243),
        Color.fromARGB(253, 155, 39, 176)
      ],
    ),
    OnboardingData(
      title: "Paso 2",
      description: "Enfoca, prospera, conquista.",
      imagePath: "assets/img/dos.jpg",
      gradientColors: [Colors.orange, Colors.yellow],
    ),
    OnboardingData(
      title: "Paso 3",
      description: "Tu guía para brillar sin límites.",
      imagePath: "assets/img/dos.jpg",
      gradientColors: [Colors.green, Colors.blue],
    ),
    OnboardingData(
      title: "Bienvenido",
      description: "Únete, comienza a desbloquear tu máximo potencial.",
      imagePath: "assets/img/157.jpg",
      gradientColors: [Colors.purple, Colors.pink],
    ),
  ];
  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = _pageController.page!.round();
      _progressWidth = _currentPage == _onboardingData.length - 1 ? 35.0 : 25.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return _buildOnboardingPage(_onboardingData[index]);
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                (index) => _buildPageIndicator(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingData data) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: CustomShapeClipper(),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      data.imagePath,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color:
                        const Color.fromRGBO(11, 117, 133, 1).withOpacity(0.70),
                    // child: ClipPath(
                    //   clipper: CustomShapeClipper(),
                    //   child: Container(
                    //     color: Colors.blue,
                    //   ),
                  ),
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     colors: data.gradientColors,
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //   ),
                  // ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(55, 55, 55, 1),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(55, 55, 55, 1),
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

  Widget _buildPageIndicator(int index) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 10),
      height: 23,
      width: _currentPage == index ? _progressWidth : 22,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color.fromRGBO(11, 117, 133, 1)
            : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String imagePath;
  final List<Color> gradientColors;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.gradientColors,
  });
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.8); // Mover a la esquina inferior izquierda
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.9,
        size.width * 0.5, size.height * 0.8); // Curva hacia arriba en el centro
    path.quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.7,
        size.width,
        size.height *
            0.8); // Curva hacia abajo hacia la esquina inferior derecha
    path.lineTo(
        size.width, 0); // Línea vertical hasta la esquina superior derecha
    path.lineTo(0, 0); // Línea hasta la esquina superior izquierda
    path.close(); // Cerrar la ruta para formar la forma Cerrar la ruta para formar la forma
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
