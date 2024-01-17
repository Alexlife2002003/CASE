import 'package:flutter/material.dart';

class DatosDeTabla {
  String aspect;
  String answer;

  DatosDeTabla({required this.aspect, required this.answer});
}

class WidgetBuilderHelper {
  final BuildContext context;
  final VoidCallback rebuildCallback;

  WidgetBuilderHelper(this.context, this.rebuildCallback);

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
        Flexible(
          child: Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }

Widget buildRadioButtonRow(String label, String value, String? groupValue,
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
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }
  Widget buildInputField(String text, TextEditingController controller) {
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
            keyboardType: TextInputType.text,
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

  Widget buildDropdownDynamic(String label, String? value, List<dynamic> items,
      Function(String?) onChanged) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration.collapsed(hintText: label),
            dropdownColor: Theme.of(context).colorScheme.onBackground,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            isExpanded: true,
            isDense: true,
            onChanged: (newValue) {
              onChanged(newValue);
              // Trigger the rebuild from the parent widget
              rebuildCallback();
            },
            items: items.map<DropdownMenuItem<String>>((dynamic value) {
              // Convert dynamic value to String
              final stringValue = value.toString();
              return DropdownMenuItem<String>(
                value: stringValue,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  child: Text(
                    stringValue,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  Widget buildDropdown(String label, String? value, List<String> items,
      Function(String?) onChanged) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration.collapsed(hintText: label),
            dropdownColor: Theme.of(context).colorScheme.onBackground,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            isExpanded: true,
            isDense: true,
            onChanged: (newValue) {
              onChanged(newValue);
              // Trigger the rebuild from the parent widget
              rebuildCallback();
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  Widget buildCustomDataTable(
      List<DatosDeTabla> data, List<String> columnLabels) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 60,
        columns: [
          const DataColumn(label: Text('Aspecto')),
          for (var label in columnLabels) DataColumn(label: Text(label)),
        ],
        rows: data.map((experiencia) {
          return DataRow(cells: [
            DataCell(SizedBox(
              width: 150,
              child: Text(experiencia.aspect),
            )),
            for (var label in columnLabels)
              DataCell(Radio(
                value: label,
                groupValue: experiencia.answer,
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context).colorScheme.onBackground;
                    } else {
                      return Colors.white;
                    }
                  },
                ),
                onChanged: (value) {
                  experiencia.answer = value as String;
                },
              )),
          ]);
        }).toList(),
      ),
    );
  }

  Widget buildGuardarButton(VoidCallback onTapCallback) {
    return Padding(
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
          onTap: onTapCallback,
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
    );
  }

  Widget buildCheckboxRow(
    String label,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.selected)
                ? Theme.of(context).colorScheme.onBackground
                : Theme.of(context).colorScheme.background;
          }),
          value: value,
          onChanged: onChanged,
          side: BorderSide(
            color: Theme.of(context).colorScheme.onBackground,
            width: 2.0,
          ),
        ),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  DataCell buildRadioCell({
    required String value,
    required String groupValue,
    required ValueChanged<String> onChanged,
  }) {
    return DataCell(Radio(
      value: value,
      groupValue: groupValue,
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Theme.of(context).colorScheme.onBackground;
        } else {
          return Colors.white;
        }
      }),
      onChanged: (value) {
        onChanged(value as String);
      },
    ));
  }
}
