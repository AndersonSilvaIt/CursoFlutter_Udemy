import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker({
    Key? key,
    this.selectedDate,
    required this.onDateChanged,
  }) : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  bool _isApple = false;

  _verifyIsIOS() {
    try {
      _isApple = Platform.isIOS;
    // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {

    _verifyIsIOS();

    return _isApple
        ? SizedBox(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(), 
            minimumDate: DateTime(2019),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onDateChanged,

          ),
        )
        : SizedBox(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: const Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
