import 'package:flutter/material.dart';

class PremiumSubscriptionView extends StatelessWidget {
  const PremiumSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Premium'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

