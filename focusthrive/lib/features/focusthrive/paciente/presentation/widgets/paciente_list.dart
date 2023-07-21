import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/busqueda.dart';
import 'package:google_fonts/google_fonts.dart';

class PsicologoList extends StatefulWidget {
  final UserData userData;
  const PsicologoList({super.key, required this.userData});

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
        color: Color.fromRGBO(220, 228, 229, 1),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Text(widget.userData
                .name[0]), // Tomamos la primera letra del nombre como avatar
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centramos verticalmente los elementos
            children: [
              Text(
                widget.userData.name,
                style: GoogleFonts.getFont(
                  'Work Sans',
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(75, 95, 111, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centramos verticalmente los elementos
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centramos horizontalmente los elementos
                children: [
                  RatingBar.builder(
                    initialRating: widget.userData.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    // ignore: prefer_const_constructors
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
    );
  }
}
