import 'package:demo/data/schedule.dart';
import 'package:flutter/material.dart';
import 'package:demo/settings/colors.dart' as colores;
import 'package:demo/settings/cadenas.dart' as cadenas;
import 'package:provider/provider.dart';
import 'package:demo/utils/picture.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 46.0),
      child: Container(
        child: !schedule.estado ? Contenido() : Imagen(),
      ),
    );
  }
}

///cuando existe foto, se muestra el siguiente widget

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
            top: MediaQuery.of(context).size.height / 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset("assets/icontexto-emoticons-01.ico"),
            ),
          ),
          Positioned(
              right: 0.0,
              bottom: 0.0,
              child: FloatingActionButton(
                backgroundColor: colores.accent,
                child: Icon(Icons.camera_alt),
                onPressed: () {
                  getImage().then((value) {
                    if (value) {
                      setState(() {
                        schedule.estado = true;
                        schedule.archivo = picture;
                      });
                    }
                  });
                },
              )),
          Positioned(
              right: 0.0,
              bottom: 0.0,
              child: FloatingActionButton(
                backgroundColor: colores.accent,
                child: Icon(Icons.camera_alt),
                onPressed: () {
                  getImage().then((value) {
                    if (value) {
                      setState(() {
                        schedule.estado = true;
                        schedule.archivo = picture;
                      });
                    }
                  });
                },
              )),
          Positioned(
              right: 80.0,
              bottom: 0.0,
              child: FloatingActionButton(
                backgroundColor: colores.accent,
                child: Icon(Icons.home),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}

///cuando no existe ninguna foto, se muestra el siguiente widget

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
                /*getImage().then((value) {
                  if (value) {
                    setState(() {
                      schedule.estado = true;
                      schedule.archivo = picture;
                    });
                  }
                });*/
                print("evento");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.camera_alt,
                    size: 100.0,
                    color: colores.border,
                  ),
                  const Text(
                    cadenas.foto,
                    style: TextStyle(color: colores.botonPhoto, fontSize: 20.0),
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
