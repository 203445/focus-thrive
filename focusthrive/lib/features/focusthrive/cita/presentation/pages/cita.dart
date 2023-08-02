import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/cita.dart';
import '../providers/deleteCita_provider.dart';
import '../providers/listCita_provider.dart';
import '../providers/updateCita_provider.dart';

class CitasListView extends StatefulWidget {
  final String idDoctor;

  const CitasListView({super.key, required this.idDoctor});

  @override
  State<CitasListView> createState() => _CitasListViewState();
}

class _CitasListViewState extends State<CitasListView> {
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
      Provider.of<GetCitaProvider>(context, listen: false)
          .listCita(widget.idDoctor);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listCita = Provider.of<GetCitaProvider>(context);
    Future<void> _reloadCitaData() async {
      await listCita.listCita(widget.idDoctor);
      setState(() {});
    }

    void _showPopupMenu(BuildContext context, Cita cita) async {
      final updateCita =
          Provider.of<UpdateCitaProvider>(context, listen: false);
      final deleteCita =
          Provider.of<DeleteCitaProvider>(context, listen: false);
      final RenderBox overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;
      final selectedOption = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(0, 0, 0, 0),
        items: [
          PopupMenuItem(
            value: 'Confirmada',
            child: Text('Confirmada'),
          ),
          PopupMenuItem(
            value: 'cancelada',
            child: Text('Cancelada'),
          ),
          if (cita.status == 'Cancelada')
            PopupMenuItem(
              value: 'eliminar',
              child: Text('Eliminar'),
            ),
        ],
      );
      if (selectedOption != null) {
        if (selectedOption == 'Confirmada') {
          print('segun confirmo');
          await updateCita.updateCita(cita.id, 'Confirmada');
          await _reloadCitaData();
        } else if (selectedOption == 'cancelada') {
          await updateCita.updateCita(cita.id, 'Cancelada');
          await _reloadCitaData();
        } else if (selectedOption == 'eliminar') {
          await deleteCita.deleteCita(cita.id);
          await _reloadCitaData();
        }
      }
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
                    child: Text(cita!.nombreP[0]),
                  ),
                  title: Text(
                    cita.nombreP,
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
                  onTap: () async {
                    _showPopupMenu(context, cita);
                  },
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
