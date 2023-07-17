import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Registro> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Apellidos'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Verificar si las contraseñas coinciden
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  // Redirigir a la siguiente vista según la selección del usuario
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserTypeScreen(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Las contraseñas no coinciden.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserTypeScreen extends StatelessWidget {
  final TextEditingController _cardNumberController = TextEditingController();

  UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo de Usuario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Selecciona tu tipo de usuario:'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Redirigir a la vista para pacientes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientScreen(),
                  ),
                );
              },
              child: Text('Paciente'),
            ),
            ElevatedButton(
              onPressed: () {
                // Redirigir a la vista para psicólogos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PsychologistScreen(
                      cardNumberController: _cardNumberController,
                    ),
                  ),
                );
              },
              child: Text('Psicólogo'),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Paciente'),
      ),
      body: Center(
        child: Text('Formulario de Registro de Paciente'),
      ),
    );
  }
}

class PsychologistScreen extends StatelessWidget {
  final TextEditingController cardNumberController;

  PsychologistScreen({required this.cardNumberController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Psicólogo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Número de Tarjeta'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Realizar el registro del psicólogo
                // ...

                // Mostrar mensaje de éxito
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Registro Exitoso'),
                      content: Text('El psicólogo ha sido registrado.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
