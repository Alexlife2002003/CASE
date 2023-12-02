import 'package:case_cuestionario/screens/Cuestionarios/AbandonoEscolar.dart';
import 'package:case_cuestionario/screens/Cuestionarios/DatosGenerales.dart';
import 'package:case_cuestionario/screens/Cuestionarios/Incorporacion.dart';
import 'package:flutter/material.dart';
import 'package:case_cuestionario/screens/Users/Login.dart';

class AppWithDrawer extends StatelessWidget {
  final Widget content;
  final String title;

  const AppWithDrawer({required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenWidth / 3,
              child: DrawerHeader(
                decoration: BoxDecoration(),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CASE',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Datos generales',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DatosGenerales()));
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Incorporacion, medios \ny recursos',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Incorporacion()));
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Area profesional',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Idioma',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Servicios Case',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Motivos de desercion \ny abandono escolar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AbandonoEscolar()));
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Salud mental',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Conectividad e \ninfraestructura',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Servicios de la \nunidad academica',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cerrar sesión',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
      body: content,
    );
  }
}
