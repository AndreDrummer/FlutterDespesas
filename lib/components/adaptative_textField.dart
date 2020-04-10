import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String label;
  final TextInputType keyboardType;
  final decoration;

  AdaptativeTextField({
    this.controller,
    this.label,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              // decoration: decoration,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
            ),
          )
        : TextField(
            decoration: InputDecoration(
              labelText: label
            ),            
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
          );
  }
}
