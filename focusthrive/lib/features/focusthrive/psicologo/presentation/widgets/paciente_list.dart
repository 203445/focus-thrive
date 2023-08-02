import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../suscripcion/presentation/pages/vista_psicologo.dart';

class PsicologoList extends StatefulWidget {
  final Psicologo userData;
  final String idPaciente;
  const PsicologoList(
      {super.key, required this.userData, required this.idPaciente});

  @override
  State<PsicologoList> createState() => _PsicologoListState();
}

class _PsicologoListState extends State<PsicologoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(2),
      child: Card(
        color: Color.fromRGBO(253, 255, 255, 1),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VistaP(
                  userData: widget.userData,
                  idPaciente: widget.idPaciente,
                ),
              ),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'http://54.83.165.193${widget.userData.urlFoto}'), // Profile photo URL
              // child: Text(widget.userData.nombre[0]), // Initial letter fallback
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.userData.nombre,
                  style: GoogleFonts.getFont(
                    'Work Sans',
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(75, 95, 111, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: widget.userData.rating.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(
                      widget.userData.rating.toString(),
                      style: GoogleFonts.getFont(
                        'Work Sans',
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(102, 109, 149, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
