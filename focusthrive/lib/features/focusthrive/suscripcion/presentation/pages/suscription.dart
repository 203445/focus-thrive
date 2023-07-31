import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/home2.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../stripe_service.dart';

class PremiumSubscriptionView extends StatefulWidget {
  @override
  _PremiumSubscriptionViewState createState() =>
      _PremiumSubscriptionViewState();
}

class _PremiumSubscriptionViewState extends State<PremiumSubscriptionView> {
  bool isMonthlyPlanSelected = false;
  bool isThreeMonthsPlanSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(11, 117, 133, 1),
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
                color: Color.fromRGBO(255, 255, 255, 1),
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
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w400,
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
                price: '\$70.00/mes',
                features: [
                  'Acceso ilimitado a contenido premium',
                  'Soporte prioritario',
                ],
                selected: isMonthlyPlanSelected,
                onSelect: () {
                  setState(() {
                    isMonthlyPlanSelected = true;
                    isThreeMonthsPlanSelected = false;
                  });
                },
              ),
              SizedBox(height: 16),
              PlanCard(
                title: 'Plan 3 meses',
                price: '\$110.00/mes',
                features: [
                  'Acceso ilimitado a contenido premium',
                  'Soporte prioritario',
                  'Ahorra un 20% en comparación con el plan mensual',
                ],
                selected: isThreeMonthsPlanSelected,
                onSelect: () {
                  setState(() {
                    isMonthlyPlanSelected = false;
                    isThreeMonthsPlanSelected = true;
                  });
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  var items = [
                    {
                      'productPrice': 110,
                      'productName': 'Subscripción de 3 meses',
                      'qty': 1
                    }
                  ];
                  var items2 = [
                    {
                      'productPrice': 70,
                      'productName': 'Subscripción de 1 meses',
                      'qty': 1
                    }
                  ];
                  if (isMonthlyPlanSelected) {
                    await StripeService.stripePaymentCheckout(
                        items2, 70, context, mounted, onSuccess: () {
                      print('SUCCES');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeP()));
                    }, onCancel: () {
                      print('CANCEL');
                    }, onError: (e) {
                      print('ERROR:' + e.toString());
                    });
                  } else {
                    await StripeService.stripePaymentCheckout(
                        items, 110, context, mounted, onSuccess: () {
                      print('SUCCES');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeP()));
                    }, onCancel: () {
                      print('CANCEL');
                    }, onError: (e) {
                      print('ERROR:' + e.toString());
                    });
                  }
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
  final bool selected;
  // final Function() onSelect;
  final VoidCallback onSelect;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          side: selected
              ? const BorderSide(color: Colors.blue, width: 2.0)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: onSelect,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: features
                        .map((feature) => ListTile(
                              leading: const Icon(Icons.check),
                              title: Text(feature),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
