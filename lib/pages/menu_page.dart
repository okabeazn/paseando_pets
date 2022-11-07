import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paseando_pets/pages/login_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.brown),
            child: Image.network(
                'https://img3.freepng.es/dy/d86c3e2984b75e9b118833418ef3ca8c/L0KzQoG3VME0N5JAj5H9cnHxg8HokvVvfF5ue9H3LXTog7rujr02bWo6SaZuM3W8RLaAVr43Omk8Tqg5NUG4SIeBUsg2OWYATacBLoDxd1==/transparent-icon-design-5e9514e3e94e76.6287660515868285159556.png'),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_pin, size: 20),
                title:
                    Text((FirebaseAuth.instance.currentUser?.email).toString()),
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20),
                title: const Text("Cerrar Sesion"),
                onTap: (() {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
