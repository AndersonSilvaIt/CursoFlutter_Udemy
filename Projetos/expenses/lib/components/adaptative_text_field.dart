import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final TextInputType? keyboardType;
  bool _isApple = false;

  AdaptativeTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.onSubmitted,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  _verifyIsIOS() {
    try {
      _isApple = Platform.isIOS;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    _verifyIsIOS();

    return _isApple
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
