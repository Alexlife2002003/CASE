import 'package:case_cuestionario/Datos/datosIdioma.dart';
import 'package:case_cuestionario/Datos/datosIncorporacion.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';

class Idioma extends StatefulWidget {
  const Idioma({super.key});

  @override
  State<Idioma> createState() => _IdiomaState();
}

class _IdiomaState extends State<Idioma> {
  String? _selectedPregunta42;
  String? _selectedPregunta43;
  String? _selectedPregunta44;

  void rebuild() {
    setState(() {
      // Perform any necessary state changes
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return AppWithDrawer(
      title: 'Idioma',
      content: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(pregunta42),
                Row(
                  children: [
                    for (var option in respuesta42)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta42, (value) {
                        setState(() {
                          _selectedPregunta42 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta43),
                Row(
                  children: [
                    for (var option in respuesta43)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta43, (value) {
                        setState(() {
                          _selectedPregunta43 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta44),
                Row(
                  children: [
                    for (var option in respuesta44)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta44, (value) {
                        setState(() {
                          _selectedPregunta44 = value;
                        });
                      }),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      border: Border.all(color: Colors.white, width: .2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              'Guardar',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
