import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  AppWithDrawer(title: 'Dashboard', content: const Scaffold(
      body: Text("Estimado(a) alumno(a), como parte de tu Trayectoria Escolar dentro de la Universidad Autónoma de Zacatecas, nos interesa conocer cuál ha sido tu experiencia dentro de esta institución educativa con el objetivo de poder ofrecerte mejores condiciones de estudio y servicios educativos mediante el programa de Seguimiento de Trayectorias Escolares.El presente formulario, tiene por Objetivo: conocer su valiosa opinión y sugerencias respecto a nuestro programa educativo, mismas que serán un importante insumo para lograr dar cumplimiento a indicadores de calidad y, por ende, formar recursos humanos más competitivos y con mayores valores, habilidades y destrezas."),
    ));
  }
}
