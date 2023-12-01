import 'package:case_cuestionario/utils/AppDrawer.dart';
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
  final _municipcioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    Widget buildInputField(String text, TextEditingController controller,
        TextInputType inputType) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          width: screenWidth - 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            border: Border.all(color: Colors.white, width: .2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: TextField(
              style: TextStyle(
                color: Colors
                    .black, // Change this line to set the input text color to red
              ),
              keyboardType: inputType,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: text,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ),
      );
    }

    return AppWithDrawer(
      title: 'Datos Generales',
      content: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 25.0), // Adjust the left margin
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Semestre*',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Tercer',
                          groupValue: selectedSemester,
                          onChanged: (value) {
                            setState(() {
                              selectedSemester = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground; // Set the color for unselected state
                              }
                            },
                          ),
                        ),
                        Text('Tercer semestre', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Quinto',
                          groupValue: selectedSemester,
                          onChanged: (value) {
                            setState(() {
                              selectedSemester = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('Quinto semestre', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Septimo',
                          groupValue: selectedSemester,
                          onChanged: (value) {
                            setState(() {
                              selectedSemester = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('Séptimo semestre', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Noveno',
                          groupValue: selectedSemester,
                          onChanged: (value) {
                            setState(() {
                              selectedSemester = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('Noveno semestre', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Nombre completo (iniciando con APELLIDO). *',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                buildInputField('Nombre completo', _nombreCompletoController,
                    TextInputType.name),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Sexo/Género *',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Mujer',
                          groupValue: selectedSexo,
                          onChanged: (value) {
                            setState(() {
                              selectedSexo = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground; // Set the color for unselected state
                              }
                            },
                          ),
                        ),
                        Text('Mujer', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Hombre',
                          groupValue: selectedSexo,
                          onChanged: (value) {
                            setState(() {
                              selectedSexo = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('Hombre', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'LGTIQ+',
                          groupValue: selectedSexo,
                          onChanged: (value) {
                            setState(() {
                              selectedSexo = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('LGTIQ+', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Municipio de procedencia. *',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                buildInputField('Municipio de procedencia',
                    _municipcioController, TextInputType.name),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Estado civil:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Soltero',
                          groupValue: selectedEstadoCivil,
                          onChanged: (value) {
                            setState(() {
                              selectedEstadoCivil = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground; // Set the color for unselected state
                              }
                            },
                          ),
                        ),
                        Text('Soltero (a)', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Casado',
                          groupValue: selectedEstadoCivil,
                          onChanged: (value) {
                            setState(() {
                              selectedEstadoCivil = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('Casado (a)', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Union',
                          groupValue: selectedEstadoCivil,
                          onChanged: (value) {
                            setState(() {
                              selectedEstadoCivil = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('Union Libre', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Otro',
                          groupValue: selectedEstadoCivil,
                          onChanged: (value) {
                            setState(() {
                              selectedEstadoCivil = value.toString();
                            });
                          },
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              } else {
                                return Theme.of(context)
                                    .colorScheme
                                    .onBackground;
                              }
                            },
                          ),
                        ),
                        Text('Otro', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '¿Trabaja actualmente? *',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.onBackground,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.selected)) {
                            return Theme.of(context).colorScheme.onBackground;
                          } else {
                            return Theme.of(context)
                                .colorScheme
                                .onBackground; // Set the color for unselected state
                          }
                        },
                      ),
                    ),
                    Text('Si', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 25),
                    Radio(
                      value: 'No',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                      },
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
                    Text('No', style: TextStyle(fontSize: 20)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Año de ingreso. *',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedYear,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Seleccione uno'),
                    dropdownColor: Theme.of(context).colorScheme.onBackground,
                    icon: Icon(Icons.arrow_drop_down),
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
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    width: screenWidth - 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      border: Border.all(color: Colors.white, width: .2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print(selectedSemester);
                        print(_nombreCompletoController.text);
                        print(selectedSexo);
                        print(_municipcioController.text);
                        print(selectedEstadoCivil);
                        print(selectedOption);
                        print(selectedYear);
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: screenWidth - 0,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Center(
                              child: Text(
                            'Guardar',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
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
