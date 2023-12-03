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

  Widget buildInputField(
      String text, TextEditingController controller, TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          border: Border.all(color: Colors.white, width: .2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            keyboardType: inputType,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 20,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(String label, String value, String? groupValue,
      Function(String?) onChanged) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.onBackground,
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.onBackground;
              } else {
                return Theme.of(context).colorScheme.onBackground;
              }
            },
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 20)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppWithDrawer(
      title: 'Datos Generales',
      content: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Semestre*',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    for (var semester in [
                      'Tercer',
                      'Quinto',
                      'Septimo',
                      'Noveno'
                    ])
                      buildRadioButton(
                          '$semester semestre', semester, selectedSemester,
                          (value) {
                        setState(() {
                          selectedSemester = value;
                        });
                      }),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Nombre completo (iniciando con APELLIDO). *',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                buildInputField('Nombre completo', _nombreCompletoController,
                    TextInputType.name),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Sexo/Género *',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    for (var gender in ['Mujer', 'Hombre', 'LGTIQ+'])
                      buildRadioButton(gender, gender, selectedSexo, (value) {
                        setState(() {
                          selectedSexo = value;
                        });
                      }),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Municipio de procedencia. *',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                buildInputField('Municipio de procedencia',
                    _municipioController, TextInputType.name),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Estado civil:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    for (var status in [
                      'Soltero (a)',
                      'Casado (a)',
                      'Union',
                      'Otro'
                    ])
                      buildRadioButton(status, status, selectedEstadoCivil,
                          (value) {
                        setState(() {
                          selectedEstadoCivil = value;
                        });
                      }),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '¿Trabaja actualmente? *',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    buildRadioButton('Si', 'Yes', selectedOption, (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    }),
                    const SizedBox(width: 25),
                    buildRadioButton('No', 'No', selectedOption, (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    }),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Año de ingreso. *',
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
                    items: <String>[
                      '2022',
                      '2021',
                      '2020',
                      '2019',
                      '2018',
                      '2017',
                      '2016',
                      'Otro',
                    ].map<DropdownMenuItem<String>>((String value) {
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
