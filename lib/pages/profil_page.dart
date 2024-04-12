import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  //edit field
  Future<void> editField(String field) async {}

  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 210, 210),
      appBar: AppBar(
        title: const Text('Halaman Profile'),
        backgroundColor: const Color.fromARGB(255, 210, 137, 109),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 30),
          //foto profil
          const Icon(
            Icons.person,
            size: 80,
          ),
          const SizedBox(height: 12),
          //email user
          const Text(
            'satria101@gmail.com',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          //detail user
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('Detail User'),
          ),

          // TextField untuk username
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: 'Masukkan username baru',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // TextField untuk biodata
          TextField(
            maxLines: 4,
            controller: bioController,
            decoration: const InputDecoration(
              labelText: 'Biodata',
              hintText: 'Masukkan biodata baru',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    usernameController.dispose();
    bioController.dispose();
    super.dispose();
  }
}
