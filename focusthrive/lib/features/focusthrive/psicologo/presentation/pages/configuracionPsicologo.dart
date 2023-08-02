import 'package:flutter/material.dart';

class DeleteAccountView extends StatefulWidget {
  final String id;

  const DeleteAccountView({super.key, required this.id});
  @override
  _DeleteAccountViewState createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  bool _isAccountDeleted = false;

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar cuenta'),
          content: Text('¿Está seguro de que desea eliminar su cuenta?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAccountDeleted = true;
                });
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar cuenta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isAccountDeleted)
              ElevatedButton(
                onPressed: _showDeleteConfirmationDialog,
                child: Text('Eliminar cuenta'),
              )
            else
              Text(
                'Su cuenta ha sido eliminada.',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
