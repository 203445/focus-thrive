import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cita {
  final String nombrePaciente;
  final DateTime fecha;
  final String status;

  Cita({
    required this.nombrePaciente,
    required this.fecha,
    required this.status,
  });
}

class CitasListView extends StatelessWidget {
  final List<Cita> citas = [
    Cita(
        nombrePaciente: 'María García',
        fecha: DateTime(2023, 07, 28),
        status: 'Pendiente'),
    Cita(
        nombrePaciente: 'Juan López',
        fecha: DateTime(2023, 08, 05),
        status: 'Confirmada'),
    Cita(
        nombrePaciente: 'Ana Martínez',
        fecha: DateTime(2023, 08, 12),
        status: 'Cancelada'),
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pendiente':
        return Colors.orange;
      case 'Confirmada':
        return Colors.green;
      case 'Cancelada':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

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
              "Lista de Citas",
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
      body: ListView.builder(
        itemCount: citas.length,
        itemBuilder: (context, index) {
          final cita = citas[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(cita.nombrePaciente[0]),
              ),
              title: Text(
                cita.nombrePaciente,
                style: TextStyle(
                    color: _getStatusColor(cita
                        .status)), // Cambia el color de texto según el estado
              ),
              subtitle: Text(
                'Fecha: ${cita.fecha.day}/${cita.fecha.month}/${cita.fecha.year} - Estado: ${cita.status}',
                style: TextStyle(
                    color: _getStatusColor(cita
                        .status)), // Cambia el color de texto según el estado
              ),
            ),
          );
        },
      ),
    );
  }
}
