import 'package:flutter/material.dart';
import 'package:demo/settings/cadenas.dart' as cadenas;

class Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24.0),
        child: const Text(cadenas.titulo, style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w300
        ),),
      
    );
  }
}