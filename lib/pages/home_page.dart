// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:paseando_pets/pages/menu_page.dart';
import 'package:paseando_pets/pages/paseadores_page.dart';
import 'package:paseando_pets/pages/regpet_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mascotas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMascotas();
  }

  Future getMascotas() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot mascota = await FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(uid)
        .collection("mascotas")
        .get();
    // QuerySnapshot mascota = await FirebaseFirestore.instance
    //     .collection("Usuarios")
    //     .doc(uid)
    //     .collection("mascotas")
    //     .where("nombre", isEqualTo: "paquito").get();

    setState(() {
      if (mascota.docs.isNotEmpty) {
        for (var masc in mascota.docs) {
          mascotas.add(masc.data());
          print("_>>>>>>>>>>>>>>>>>>>>>>>${masc.data().toString()}");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paseando Pets"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterMascota()));
              },
              icon: const Icon(Icons.accessibility_rounded,
                  size: 30, color: Colors.white))
        ],
      ),
      drawer: MenuPage(),
      body: ListView.builder(
          itemCount: mascotas.length,
          itemBuilder: (BuildContext context, i) {
            return ListTile(
              title: miCardImage(mascotas[i]["foto"],
                  mascotas[i]["nombre"] + '\n' + mascotas[i]["tipo"]),
              onTap: () {},
            );
          }),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text("Hola: ${FirebaseAuth.instance.currentUser?.email.toString()}")
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaseadoresPage()));
          }),
      bottomNavigationBar: const menuInferior(),
    );
  }
}

class miCardImage extends StatelessWidget {
  final String url;
  final String texto;

  miCardImage(
    this.url,
    this.texto,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin: EdgeInsets.all(20),
      elevation: 20,
      color: Colors.brown,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Image.network(url),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              color: Colors.black,
              child: Text(texto,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
