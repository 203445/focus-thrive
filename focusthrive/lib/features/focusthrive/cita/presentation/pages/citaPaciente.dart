import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/getCitaPaciente_provider.dart';

class CitasPacienteListView extends StatefulWidget {
  final String idPaciente;

  const CitasPacienteListView({super.key, required this.idPaciente});

  @override
  State<CitasPacienteListView> createState() => _CitasListViewState();
}

class _CitasListViewState extends State<CitasPacienteListView> {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetCitaPacienteProvider>(context, listen: false)
          .listCitaPaciente(widget.idPaciente);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listCita = Provider.of<GetCitaPacienteProvider>(context);
    Future<void> _reloadCitaData() async {
      await listCita.listCitaPaciente(widget.idPaciente);
      setState(() {});
    }

    if (listCita.cita == null || listCita.cita?.length == 0) {
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
        body: Center(
          child: Text(
            'Aun no tienes citas agendadas',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView.builder(
            itemCount: listCita.cita?.length ?? 0,
            itemBuilder: (context, index) {
              final cita = listCita.cita?[index];

              return Card(
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(cita!.nombreD[0]),
                  ),
                  title: Text(
                    cita.nombreD,
                    style: TextStyle(
                        color: _getStatusColor(cita
                            .status)), // Cambia el color de texto según el estado
                  ),
                  subtitle: Text(
                    'Fecha: ${cita.horario}   - Estado: ${cita.status}',
                    style: TextStyle(
                        color: _getStatusColor(cita
                            .status)), // Cambia el color de texto según el estado
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
