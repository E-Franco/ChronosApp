import 'package:flutter/material.dart';

abstract class AuthStyles {
  static InputBorder get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      );

  static InputBorder get unfocusedBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      );

  static InputBorder get errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      );
}
