import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genero { Femenino, Masculino }

class _RegisterPageState extends State<RegisterPage> {
  final nombres = TextEditingController();
  final apellidos = TextEditingController();
  final telefono = TextEditingController();
  final direccion = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConf = TextEditingController();
  Genero? _genero = Genero.Femenino;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: const Image(
                    image: AssetImage("assets/images/perro.png"),
                    width: 120,
                    height: 120,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.all(20),
                ),
                TextFormField(
                  controller: nombres,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: "Nombres",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.brown,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: apellidos,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: "Apellidos",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.brown,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.brown,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: telefono,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: "Telefono",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.phone,
                        color: Colors.brown,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: direccion,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: "Direccion",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.house,
                        color: Colors.brown,
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
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordConf,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password Confirmation",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.password,
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
                    onPressed: () {},
                    child: const Text("Registrarse")),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
