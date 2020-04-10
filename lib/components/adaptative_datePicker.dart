import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AdaptativeDatePicker extends StatelessWidget {
  final selectedDate;
  final Function(DateTime) onDateChange;

  AdaptativeDatePicker({this.selectedDate, this.onDateChange});

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
      onDateChange(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoDatePicker(
            onDateTimeChanged: onDateChange,
            mode: CupertinoDatePickerMode.date,
            minimumDate: DateTime.now(),
            initialDateTime: DateTime(2019),
            maximumDate: DateTime.now(),
          )
        : Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(selectedDate != null
                        ? "Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}"
                        : "Nenhuma data selecionada")),
                FlatButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text(selectedDate == null
                      ? "Selecionar Data"
                      : "Alterar Data"),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          );
  }
}
