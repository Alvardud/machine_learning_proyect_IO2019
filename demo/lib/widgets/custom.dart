import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'package:demo/schedule.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:demo/widgets/canvas.dart' as canvas;
import 'package:demo/settings/colors.dart' as colores;
import 'package:demo/settings/cadenas.dart' as cadenas;
import 'package:provider/provider.dart';

File picture;
Future<bool> _getImage() async {
  picture = await ImagePicker.pickImage(
      source: ImageSource.camera, maxWidth: 350.0, maxHeight: 350.0);
  if (picture != null) {
    return true;
  } else {
    return false;
  }
}

class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 36.0),
      child: Container(
        child: !schedule.estado ? Contenido() : Imagen(),
      ),
    );
  }
}

class Imagen extends StatefulWidget {
  @override
  _ImagenState createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);

    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width / 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.file(
                schedule.archivo,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
              right: 40.0,
              bottom: 0.0,
              child: FloatingActionButton(
                backgroundColor: colores.accent,
                child: Icon(Icons.camera_alt),
                onPressed: () {
                  _getImage().then((value) {
                  if (value) {
                    setState(() {
                      schedule.estado = true;
                      schedule.archivo = picture;
                    });
                  }
                });
                },
              ))
        ],
      ),
    );
  }
}

class Contenido extends StatefulWidget {
  @override
  _ContenidoState createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);
    return Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: InkWell(
              onTap: () {
                _getImage().then((value) {
                  if (value) {
                    setState(() {
                      schedule.estado = true;
                      schedule.archivo = picture;
                    });
                  }
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.camera_alt,
                      size: 100.0, color: colores.border
                  ),
                  
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}




