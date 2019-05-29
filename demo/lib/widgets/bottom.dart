import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/schedule.dart';
import 'package:demo/settings/cadenas.dart' as cadenas;
import 'package:demo/settings/colors.dart' as colores;
import 'package:demo/widgets/canvas.dart' as canvas;
import 'dart:math';

class Bottom extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);
    return Container(
      margin: const EdgeInsets.only(
          bottom: 16.0, left: 36.0, right: 36.0, top: 8.0),
      child: !schedule.estado ? BotonEncuesta() : Resultados(),
    );
  }
}

class BotonEncuesta extends StatelessWidget {
  Widget IconButton() {
    return new Icon(
      Icons.home,
      size: 65.0,
      color: Colors.black45,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 14,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 1.0),
                child: const Text(
                  cadenas.titulo,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
                child: InkWell(
              //child: boton(),
              child: InkWell(
              child: IconButton(),
              onTap: () {
                //TODO: llevarme a las encuestas
              },
            )),
            ))
        ],
      ),
    );
  }
}

class Resultados extends StatefulWidget {
  @override
  _ResultadosState createState() => _ResultadosState();
}

class _ResultadosState extends State<Resultados> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Resultados:",
              style: TextStyle(fontSize: 20.0, color: colores.textoPlano),
            ),
            Expanded(child:Emociones()),
          ],
        ));
  }
}

class Emociones extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Felices(),
          ),
          Expanded(
            child: Tristes(),
          )
        ],
      ),
    );
  }
}

class Felices extends StatefulWidget {

  @override
  _FelicesState createState() => _FelicesState();
}

class _FelicesState extends State<Felices> {
  Random numero = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Emocion(texto: "Feliz", tamano: numero.nextDouble()*80),
          ),
          Expanded(
            child: Emocion(texto: "Modesto", tamano: numero.nextDouble()*80),
          ),
          Expanded(
            child: Emocion(texto: "Reir", tamano: numero.nextDouble()*80),
          ),
        ],
      ),
    );
  }
}

class Tristes extends StatefulWidget {

  @override
  _TristesState createState() => _TristesState();
}

class _TristesState extends State<Tristes> {
  Random numero = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Emocion(texto: "Triste", tamano: numero.nextDouble()*80),
          ),
          Expanded(
            child: Emocion(texto: "Serio", tamano: numero.nextDouble()*80),
          ),
          Expanded(
            child: Emocion(texto: "Asombrado", tamano: numero.nextDouble()*80),
          ),
        ],
      ),
    );
  }
}

class Emocion extends StatefulWidget {
  final String texto;
  final double tamano;

  Emocion({this.tamano, this.texto});

  @override
  _EmocionState createState() => _EmocionState();
}

class _EmocionState extends State<Emocion> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController animationController;
  double valor;

  @override
  void initState() {
    valor = (widget.tamano.round()*10)/10;
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0.0,end: valor).animate(animationController);
    
    animation.addListener((){
      setState(() {
      });
    });
    
    animation.addStatusListener((status){});
    
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.texto,
          style: TextStyle(
            color: colores.textoPlano,
          ),
        ),
        SizedBox(width: 8.0,),
        Expanded(child:canvas.Controlador(tamano: valor)),
      ],
    );
  }
}
