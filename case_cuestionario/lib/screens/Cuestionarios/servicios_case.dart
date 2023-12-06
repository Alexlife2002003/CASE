import 'package:case_cuestionario/Datos/datosServiciosCase.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';

class ServiciosCase extends StatefulWidget {
  const ServiciosCase({super.key});

  @override
  State<ServiciosCase> createState() => _ServiciosCaseState();
}

class _ServiciosCaseState extends State<ServiciosCase> {
  String? _selectedPregunta45;
  String? _selectedPregunta46;
  String? _selectedPregunta47;
  String? _selectedPregunta48;
  String? _selectedPregunta49;
  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);
    return AppWithDrawer(
      title: 'Servicios CASE',
      content: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(pregunta45),
                Row(
                  children: [
                    for (var option in respuesta45)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta45, (value) {
                        setState(() {
                          _selectedPregunta45 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta46),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta46,
                  respuesta46,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta46 = newValue;
                    });
                  },
                ),
                buildText(pregunta47),
                helper.buildDropdown(
                  'Seleccione uno:',
                  _selectedPregunta47,
                  respuesta47,
                  (String? newValue) {
                    setState(() {
                      _selectedPregunta47 = newValue;
                    });
                  },
                ),
                buildText(pregunta48),
                Row(
                  children: [
                    for (var option in respuesta48)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta48, (value) {
                        setState(() {
                          _selectedPregunta48 = value;
                        });
                      }),
                  ],
                ),
                buildText(pregunta49),
                Column(
                  children: [
                    for (var option in respuesta49)
                      helper.buildRadioButton(
                          option, option, _selectedPregunta49, (value) {
                        setState(() {
                          _selectedPregunta49 = value;
                        });
                      }),
                  ],
                ),
                const SizedBox(height: 25),
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
