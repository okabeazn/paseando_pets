// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:paseando_pets/model/modelos_modelo.dart';
import 'package:paseando_pets/pages/home_page.dart';

class DetallePaseador extends StatefulWidget {
  final DatosPaseador paseador;

  DetallePaseador({
    required this.paseador,
  });

  @override
  State<DetallePaseador> createState() => _DetallePaseadorState();
}

class _DetallePaseadorState extends State<DetallePaseador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.paseador.nombre)),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            miCardImage(
                widget.paseador.foto,
                widget.paseador.nombre +
                    "\n" +
                    widget.paseador.contacto +
                    "\n" +
                    widget.paseador.ciudad +
                    "\n\n" +
                    widget.paseador.perfil),
            RatingBar.builder(
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                print(rating);
              },
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            )
          ],
        ),
      )),
    );
  }
}
