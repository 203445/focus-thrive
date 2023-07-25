import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/widgets/buton.dart';
import 'package:lottie/lottie.dart';
import 'features/focusthrive/paciente/presentation/pages/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final PageController _pageController = PageController();

  int _currentPage = 0;
  double _progressWidth = 30.0; // Ancho inicial de la barra de progreso
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      if (_animationController.value > 0.80) {
        _animationController.stop();
      }
    });
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = _pageController.page!.round();
      _isLastPage = _currentPage == _onboardingData.length - 1;
      _progressWidth = _isLastPage ? 35.0 : 25.0;
    });
  }

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: "Paso 1",
      description: "Dale un impulso a tu bienestar emocional.",
      imagePath: "assets/img/traquilidad.jpg",
    ),
    OnboardingData(
      title: "Paso 2",
      description: "Enfoca, prospera, conquista.",
      imagePath: "assets/img/enfoque.jpg",
    ),
    OnboardingData(
      title: "Paso 3",
      description: "Tu guía para brillar sin límites.",
      imagePath: "assets/img/guia.jpg",
    ),
    OnboardingData(
      title: "Bienvenido",
      description: "Únete, comienza a desbloquear tu máximo potencial.",
      imagePath: "assets/img/157.jpg",
    ),
  ];

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
                  Image.asset(
                    data.imagePath,
                    height: MediaQuery.of(context).size.width * 1.3,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    color:
                        const Color.fromRGBO(11, 117, 133, 1).withOpacity(0.6),
                  ),
                  if (!_isLastPage)
                    Center(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRect(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.7, // Ancho de la imagen
                              child: Image.asset(
                                "assets/img/focus.png",
                                fit: BoxFit.fill,
                                width: 155,
                              ),
                            ),
                          ),
                          const Text(
                            'FocusThrive',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (!_isLastPage)
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      data.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 23,
                          color: Color.fromRGBO(55, 55, 55, 1),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          if (_isLastPage)
            Expanded(
              flex: 2,
              child: Lottie.asset(
                "assets/json/thrive.json",
                repeat: false,
              ),
            ),
          if (_isLastPage)
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(data.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 23,
                            color: Color.fromRGBO(55, 55, 55, 1),
                            fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: 30,
                    ),
                    customButton('Iniciar sesión', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPaciente()));
                      // context.read<UsersBloc>().add(Register(
                      //     email: emailController.text,
                      //     password: passwordController.text));
                      print("ok inicio");
                    }, context),
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

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
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
