import 'package:flutter/material.dart';
import 'package:paseando_pets/pages/home_page.dart';
import 'package:paseando_pets/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  void validarUsuario() {
    if (email.text.isEmpty || password.text.isEmpty) {
      snackMessage("Ingrese informacion");
    } else if (email.text == "santione92@gmail.com" &&
        password.text == "12345") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      snackMessage("Datos Incorrectos");
    }
  }

  void snackMessage(String message) {
    final screen = ScaffoldMessenger.of(context);
    screen.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.brown,
    ));
  }

  @override
  Widget build(BuildContext context) {
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
