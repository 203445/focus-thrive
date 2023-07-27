import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumSubscriptionView extends StatelessWidget {
  const PremiumSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
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
              icon: const Icon(
                Icons.navigate_before_rounded,
                size: 43,
                color: Color.fromRGBO(20, 148, 164, 1),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Unete",
              style: GoogleFonts.getFont(
                'Work Sans',
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(77, 95, 111, 1),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Elige tu plan Premium',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Disfruta de características exclusivas',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              PlanCard(
                title: 'Plan Mensual',
                price: '\$9.99/mes',
                features: [
                  'Acceso ilimitado a contenido premium',
                  'Descargas sin límites',
                  'Soporte prioritario',
                ],
              ),
              SizedBox(height: 16),
              PlanCard(
                title: 'Plan Anual',
                price: '\$99.99/año',
                features: [
                  'Acceso ilimitado a contenido premium',
                  'Descargas sin límites',
                  'Soporte prioritario',
                  'Ahorra un 20% en comparación con el plan mensual',
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Lógica para suscribirse al plan premium
                },
                child: Text(
                  'Suscribirse',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Column(
              children: features
                  .map((feature) => ListTile(
                        leading: Icon(Icons.check),
                        title: Text(feature),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
