import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:paseando_pets/model/modelos_modelo.dart';
import 'package:paseando_pets/model/paseadores_local.dart';
import 'package:paseando_pets/pages/home_page.dart';

import '../repository/Boxes.dart';

class DetallePaseador extends StatefulWidget {
  final DatosPaseador paseador;

  DetallePaseador({
    required this.paseador,
  });

  @override
  State<DetallePaseador> createState() => _DetallePaseadorState();
}

class _DetallePaseadorState extends State<DetallePaseador> {
  var favorito = false;

  @override
  void initState() {
    getFavoritos();
  }

  void getFavoritos() {
    final box = Boxes.boxFavoritos();
    for (var element in box.values) {
      if (element.id == widget.paseador.id) {
        favorito = true;
      }
    }
  }

  void agregarFav() {
    var paseadorFav = PaseadoresLocal()
      ..id = widget.paseador.id
      ..nombre = widget.paseador.nombre
      ..contacto = widget.paseador.contacto
      ..ciudad = widget.paseador.ciudad
      ..foto = widget.paseador.foto
      ..perfil = widget.paseador.perfil;

    final box = Boxes.boxFavoritos();
    // box.add(paseadorFav);
    if (favorito) {
      box.delete(paseadorFav.id);
    } else {
      box.put(paseadorFav.id, paseadorFav);
    }
    setState(() {
      favorito = !favorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.paseador.nombre), actions: [
        IconButton(
            onPressed: () {
              agregarFav();
            },
            icon: Icon(
                favorito ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                size: 30,
                color: Colors.red))
      ]),
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
                print(rating); //just for testing
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
