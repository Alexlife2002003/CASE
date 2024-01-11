import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return AppWithDrawer(
      title: 'Dashboard',
      content: const Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Estimado(a) alumno(a),\n\nComo parte de tu Trayectoria Escolar dentro de la Universidad Autónoma de Zacatecas, nos interesa conocer cuál ha sido tu experiencia dentro de esta institución educativa. El objetivo es poder ofrecerte mejores condiciones de estudio y servicios educativos mediante el programa de Seguimiento de Trayectorias Escolares.\n\nEl presente formulario tiene por objetivo conocer tu valiosa opinión y sugerencias respecto a nuestro programa educativo. Estos comentarios serán un importante insumo para lograr dar cumplimiento a indicadores de calidad y, por ende, formar recursos humanos más competitivos con mayores valores, habilidades y destrezas.\n",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
