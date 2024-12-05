import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 245, 233),
        title: Text(
          "Perfil",
          style: TextStyle(
            fontWeight: FontWeight.w800),
          ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 245, 233),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                ),
                SizedBox(height: 10,),
                Text(
                  "Placeholder",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 50),
                Container(
                   width: 350.0,
                   height: 80.0,
                   decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 205, 194),
                  borderRadius: BorderRadius.circular(40.0),
                   )
                ),
                SizedBox(height: 20),
                Container(
                   width: 350.0,
                   height: 80.0,
                   decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 205, 194),
                  borderRadius: BorderRadius.circular(40.0),
                   )
                ),
                SizedBox(height: 20),
                Container(
                   width: 350.0,
                   height: 80.0,
                   decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 205, 194),
                  borderRadius: BorderRadius.circular(40.0),
                   )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}