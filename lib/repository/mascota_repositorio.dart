import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pets/model/mascota_modelo.dart';

class MascotaRegistrar {
  Future<String> crearMascota(Mascota mascota) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final nombreMascota = await FirebaseFirestore.instance
          .collection("Usuarios")
          .doc(uid)
          .collection("mascotas")
          .where("nombre", isEqualTo: mascota.nombre)
          .snapshots();
      var x = [];
      nombreMascota.listen(
          (data) => data.docs.forEach((element) => x.add(element["nombre"])));
      print("----------------->>${nombreMascota.toList().toString().length}");

      final documentMasc = await FirebaseFirestore.instance
          .collection("Usuarios")
          .doc(uid)
          .collection("mascotas")
          .doc();
      mascota.id = documentMasc.id;
      final resultado = await FirebaseFirestore.instance
          .collection("Usuarios")
          .doc(uid)
          .collection("mascotas")
          .doc(mascota.id)
          .set(mascota.convertir());

      // return mascota.id;
      return "";
    } on FirebaseException catch (e) {
      print(e.code);
      return e.toString();
    }
  }
}
