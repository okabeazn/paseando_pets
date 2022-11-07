import 'package:flutter/material.dart';
import 'package:paseando_pets/pages/home_page.dart';
import 'package:paseando_pets/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pets/repository/utilities.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  late final Utilities utl;

  void validarUsuario() async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      if (user != null) {
        utl.snackMessage("Bienvenido");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          utl.snackMessage("El formato del email no es correcto");
          break;
        case "user-not-found":
          utl.snackMessage("El usuario no esta registrado");
          break;
        case "wrong-password":
          utl.snackMessage("Contraseña incorrecta");
          break;
        case "unknow":
          utl.snackMessage("Complete la informacion");
          break;
        case "network-request-failed":
          utl.snackMessage("Revise su conexion a internet");
          break;
        default:
          utl.snackMessage("Error para iniciar sesion ${e.code}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    utl = Utilities(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  margin: const EdgeInsets.all(30),
                  child: const Image(
                      image: AssetImage("assets/images/perro.png"),
                      width: 150,
                      height: 150),
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.brown,
                        size: 30,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.password,
                        color: Colors.brown,
                        size: 30,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 76, 65, 31),
                          textStyle: const TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: const Text("Registrarse"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: const Color.fromARGB(255, 57, 56, 55),
                            backgroundColor:
                                const Color.fromARGB(255, 76, 65, 31),
                            fixedSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          validarUsuario();
                        },
                        child: const Text("Iniciar Sesion")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
