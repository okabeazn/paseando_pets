import 'package:flutter/material.dart';
import 'package:paseando_pets/model/paseadores_local.dart';
import 'package:paseando_pets/pages/menu_page.dart';
import 'package:paseando_pets/repository/Boxes.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:paseando_pets/model/modelos_modelo.dart';
import 'detallePaseador_page.dart';

class FavPaseadores extends StatefulWidget {
  const FavPaseadores({super.key});

  @override
  State<FavPaseadores> createState() => _FavPaseadoresState();
}

class _FavPaseadoresState extends State<FavPaseadores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favoritos"),
        ),
        drawer: MenuPage(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListaFavoritos(),
        ),
        bottomNavigationBar: const menuInferior());
  }

  Widget ListaFavoritos() {
    return ValueListenableBuilder<Box<PaseadoresLocal>>(
        valueListenable: Boxes.boxFavoritos().listenable(),
        builder: (context, box, _) {
          final lista = box.values.toList().cast<PaseadoresLocal>();
          return ListView.builder(
              padding: const EdgeInsets.all(30),
              itemCount: lista.length,
              itemBuilder: (BuildContext context, i) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(lista[i].foto ?? "Sin imagen"),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          lista[i].nombre ?? "Sin nombre",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          lista[i].ciudad ?? "sin ciudad",
                        ),
                        onTap: () {
                          DatosPaseador paseadorNew = DatosPaseador(
                              nombre: lista[i].nombre ?? "",
                              ciudad: lista[i].ciudad ?? "",
                              foto: lista[i].foto ?? "",
                              perfil: lista[i].perfil ?? "",
                              contacto: lista[i].contacto ?? "",
                              id: lista[i].id ?? "");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetallePaseador(
                                        paseador: paseadorNew,
                                      )));
                        },
                        onLongPress: () {
                          setState(() {
                            lista[i].delete();
                          });
                        },
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
