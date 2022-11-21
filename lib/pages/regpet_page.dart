import 'package:flutter/material.dart';
import 'package:paseando_pets/model/mascota_modelo.dart';
import 'package:paseando_pets/pages/home_page.dart';
import 'package:paseando_pets/pages/menu_page.dart';
import 'package:paseando_pets/repository/mascota_repositorio.dart';
import 'package:paseando_pets/repository/utilities.dart';

class RegisterMascota extends StatefulWidget {
  const RegisterMascota({super.key});

  @override
  State<RegisterMascota> createState() => _RegisterMascotaState();
}

enum Genero { Femenino, Masculino }

class _RegisterMascotaState extends State<RegisterMascota> {
  final nombre = TextEditingController();

  final tipo = TextEditingController();

  final color = TextEditingController();

  Genero? _genero = Genero.Femenino;

  MascotaRegistrar mas = MascotaRegistrar();
  late Utilities utl;

  void traerDatos() {
    setState(() {
      String foto =
          "https://firebasestorage.googleapis.com/v0/b/paseando-pets-6c060.appspot.com/o/img_mascotas%2Fdog.jpg?alt=media&token=f79768d5-9b1a-44d3-ba8f-ac128abbfa32";
      if (nombre.text.isNotEmpty &&
          tipo.text.isNotEmpty &&
          color.text.isNotEmpty) {
        String genero = "Femenino";
        if (_genero == Genero.Femenino) {
          genero = "Masculino";
        }
        var masNew =
            Mascota(color.text, tipo.text, genero, "", nombre.text, foto);
        registrarMascota(masNew);
      }
    });
  }

  void registrarMascota(Mascota mascota) async {
    var id = await mas.crearMascota(mascota);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    utl.snackMessage("Mascota creada");
  }

  @override
  Widget build(BuildContext context) {
    utl = Utilities(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Registre su mascota")),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.all(20),
                  child: const Image(
                    image: AssetImage("assets/images/perro.png"),
                    width: 50,
                    height: 50,
                  ),
                ),
                TextFormField(
                  controller: nombre,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.pets,
                        color: Colors.brown,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: tipo,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: "Tipo",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.pets,
                        color: Colors.brown,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: color,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: "Color",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.pets,
                        color: Colors.brown,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Radio(
                                value: Genero.Femenino,
                                groupValue: _genero,
                                onChanged: (Genero? value) {
                                  setState(() {
                                    _genero = value;
                                  });
                                }),
                            const Expanded(
                              child: Text('Femenino'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Radio(
                                value: Genero.Masculino,
                                groupValue: _genero,
                                onChanged: (Genero? value) {
                                  setState(() {
                                    _genero = value;
                                  });
                                }),
                            const Expanded(child: Text('Masculino'))
                          ],
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black12,
                        fixedSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        textStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        )),
                    onPressed: () {
                      traerDatos();
                    },
                    child: const Text("Registrar Mascota")),
              ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
}
