import 'package:case_cuestionario/Datos/datosDatosGenerals.dart';
import 'package:case_cuestionario/utils/WidgetBuilderHelper.dart';
import 'package:case_cuestionario/utils/app_drawer.dart';
import 'package:case_cuestionario/utils/widgets.dart';
import 'package:flutter/material.dart';

class DatosGenerales extends StatefulWidget {
  const DatosGenerales({Key? key}) : super(key: key);

  @override
  State<DatosGenerales> createState() => _DatosGeneralesState();
}

class _DatosGeneralesState extends State<DatosGenerales> {
  String? selectedSemester;
  String? selectedSexo;
  String? selectedEstadoCivil;
  String? selectedOption;
  String? selectedYear;
  final _nombreCompletoController = TextEditingController();
  final _municipioController = TextEditingController();

  
  void rebuild() {
    setState(() {
      // Perform any necessary state changes
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetBuilderHelper helper = WidgetBuilderHelper(context, rebuild);

    return AppWithDrawer(
      title: 'Datos Generales',
      content: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    semestretext,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    for (var semester in semestre)
                      helper.buildRadioButton(
                          '$semester semestre', semester, selectedSemester,
                          (value) {
                        setState(() {
                          selectedSemester = value;
                        });
                      }),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    nombrecompleto,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                helper.buildInputField(
                    hintNombre, _nombreCompletoController),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    sexoGenero,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    for (var gender in genero)
                      helper.buildRadioButton(gender, gender, selectedSexo, (value) {
                        setState(() {
                          selectedSexo = value;
                        });
                      }),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    municipio,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                helper.buildInputField(
                    hintMunicipio, _municipioController),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    estadocivil,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    for (var status in estadoCivil)
                      helper.buildRadioButton(status, status, selectedEstadoCivil,
                          (value) {
                        setState(() {
                          selectedEstadoCivil = value;
                        });
                      }),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    trabaja,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    helper.buildRadioButton('Si', 'Yes', selectedOption, (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    }),
                    const SizedBox(width: 25),
                    helper.buildRadioButton('No', 'No', selectedOption, (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    }),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    yearingreso,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedYear,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedYear = newValue;
                      });
                    },
                    items: anio.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background),
                        ),
                      );
                    }).toList(),
                  ),
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
                      onTap: () {
                        if (selectedSemester == null ||
                            selectedSemester!.isEmpty) {
                          showSnackbar(
                              context,
                              '¡Dejaste el semestre sin contestar!',
                              Theme.of(context).colorScheme.error);

                          return;
                        }

                        if (_nombreCompletoController.text.isEmpty) {
                          showSnackbar(
                              context,
                              '¡Dejaste tu nombre sin contestar!',
                              Theme.of(context).colorScheme.error);
                          return;
                        }

                        if (selectedSexo == null || selectedSexo!.isEmpty) {
                          showSnackbar(
                              context,
                              '¡Dejaste tu sexo sin contestar!',
                              Theme.of(context).colorScheme.error);
                          return;
                        }

                        if (_municipioController.text.isEmpty) {
                          showSnackbar(
                              context,
                              '¡Dejaste el municipio sin contestar!',
                              Theme.of(context).colorScheme.error);
                          return;
                        }

                        if (selectedEstadoCivil == null ||
                            selectedEstadoCivil!.isEmpty) {
                          showSnackbar(
                              context,
                              '¡Dejaste tu estado civil sin contestar!',
                              Theme.of(context).colorScheme.error);
                          return;
                        }

                        if (selectedOption == null || selectedOption!.isEmpty) {
                          showSnackbar(
                              context,
                              '¡Dejaste si trabajas sin contestar!',
                              Theme.of(context).colorScheme.error);
                          return;
                        }

                        if (selectedYear == null || selectedYear!.isEmpty) {
                          showSnackbar(
                              context,
                              '¡Dejaste tu año de ingreso sin contestar!',
                              Theme.of(context).colorScheme.error);

                          return;
                        }

                        // If none of the above conditions are met, all values are valid
                        debugPrint(selectedSemester);
                        debugPrint(_nombreCompletoController.text.trim());
                        debugPrint(selectedSexo);
                        debugPrint(_municipioController.text);
                        debugPrint(selectedEstadoCivil);
                        debugPrint(selectedOption);
                        debugPrint(selectedYear);
                      },
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
