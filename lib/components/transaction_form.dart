import 'package:expenses/components/adaptative_datePicker.dart';
import 'package:expenses/components/adaptative_textField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './adaptative_button.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value, DateTime date) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _onSubmitForm() {
    final value = double.tryParse(valueController.text) ?? 0.0;
    final title = titleController.text;

    if (value <= 0 || title.isEmpty || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + (MediaQuery.of(context).viewInsets.bottom),
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                label: 'Título',
                controller: titleController,
                onSubmitted: (_) => _onSubmitForm(),
              ),
              AdaptativeTextField(
                label: 'Valor',
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _onSubmitForm(),
              ),                          
              AdaptativeDatePicker(
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
                selectedDate: _selectedDate,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _onSubmitForm,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
