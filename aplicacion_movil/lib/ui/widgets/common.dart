import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24.0),
        child: const Text("Detección de emociones", style: 
        TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w300
        ),
      ),
      
    );
  }
}