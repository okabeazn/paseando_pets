// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paseando_pets/model/modelos_modelo.dart';

import 'package:paseando_pets/pages/detallePaseador_page.dart';
import 'package:paseando_pets/pages/home_page.dart';
import 'package:paseando_pets/pages/menu_page.dart';

class PaseadoresPage extends StatefulWidget {
  PaseadoresPage({Key? key}) : super(key: key);

  @override
  State<PaseadoresPage> createState() => _PaseadoresPageState();
}

class _PaseadoresPageState extends State<PaseadoresPage> {
  List paseadores = [];
  List idDoc = [];
  final buscar = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPaseador();
  }

  Future getPaseador() async {
    String id = "";
    QuerySnapshot paseador =
        await FirebaseFirestore.instance.collection("Paseadores").get();
    // QuerySnapshot mascota = await FirebaseFirestore.instance
    //     .collection("Usuarios")
    //     .doc(uid)
    //     .collection("mascotas")
    //     .where("nombre", isEqualTo: "paquito").get();

    setState(() {
      if (paseador.docs.isNotEmpty) {
        for (var pas in paseador.docs) {
          id = pas.id;
          idDoc.add(id);
          paseadores.add(pas.data());
          print("_>>>>>>>>>>>>>>>>>>>>>>>${pas.data().toString()}");
        }
      }
    });
  }

  Future getCiudad() async {
    idDoc.clear();
    paseadores.clear();
    String id = "";
    QuerySnapshot paseoCiudad = await FirebaseFirestore.instance
        .collection("Paseadores")
        .where("ciudad", isEqualTo: buscar.text)
        .get();
    // QuerySnapshot mascota = await FirebaseFirestore.instance
    //     .collection("Usuarios")
    //     .doc(uid)
    //     .collection("mascotas")
    //     .where("nombre", isEqualTo: "paquito").get();

    setState(() {
      if (paseoCiudad.docs.isNotEmpty) {
        for (var pas in paseoCiudad.docs) {
          id = pas.id;
          idDoc.add(id);
          paseadores.add(pas.data());
          print("_>>>>>>>>>>>>>>>>>>>>>>>${pas.data().toString()}");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paseador"),
      ),
      drawer: MenuPage(),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 5, right: 0, bottom: 0),
                  child: TextFormField(
                    controller: buscar,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Ciudad",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      getCiudad();
                    });
                  },
                  padding: const EdgeInsets.only(right: 5, top: 15),
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.brown,
                  ))
            ],
          ),
          const SizedBox(
            height: 500,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView.builder(
                itemCount: paseadores.length,
                itemBuilder: (BuildContext context, i) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            paseadores[i]["foto"],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            paseadores[i]["nombre"],
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text(
                            paseadores[i]["ciudad"],
                          ),
                          onTap: () {
                            DatosPaseador paseadorNew = DatosPaseador(
                                nombre: paseadores[i]["nombre"],
                                ciudad: paseadores[i]["ciudad"],
                                foto: paseadores[i]["foto"],
                                perfil: paseadores[i]["perfil"],
                                contacto: paseadores[i]["contacto"],
                                id: idDoc[i]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetallePaseador(
                                          paseador: paseadorNew,
                                        )));
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text("Hola: ${FirebaseAuth.instance.currentUser?.email.toString()}")
      //     ],
      //   ),
      // ),
    );
  }
}
