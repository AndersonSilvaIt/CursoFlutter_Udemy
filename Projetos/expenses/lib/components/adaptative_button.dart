import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdaptativeButton extends StatelessWidget {

  final String label;
  final Function() onPressed;
  bool _isApple = false;

  AdaptativeButton(
    this.label,
    this.onPressed, {
    Key? key,
  }) : super(key: key);

  
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
        ? CupertinoButton(
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
              ),
            ),
          );
  }
}
