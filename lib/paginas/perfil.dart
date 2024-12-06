import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final image_piker = ImagePicker();
  File? image_file;

  pick(ImageSource source) async{
    final pickedFile = await image_piker.pickImage(source: source);

    if(pickedFile != null){
      setState(() {
        image_file = File(pickedFile.path);
      });
    }
  }

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.grey[200],
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.grey[300],
                            backgroundImage:
                                image_file != null ? FileImage(image_file!) : null,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: IconButton(
                              onPressed: _showOpcoesBottomSheet,
                              icon: Icon(
                                Icons.edit,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
                SizedBox(height: 10,),
                Center(
                  child: Text(
                    "Placeholder",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),
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
                ),
              ],
            ),
          );
  }
  void _showOpcoesBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      Icons.photo,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Galeria',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Buscar imagem da galeria
                  pick(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Câmera',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Fazer foto da câmera
                  pick(ImageSource.camera);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Remover',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Tornar a foto null
                  setState(() {
                    image_file = null;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

}

