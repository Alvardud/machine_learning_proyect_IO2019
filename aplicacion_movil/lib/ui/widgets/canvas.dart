import 'package:flutter/material.dart';
import 'package:demo/settings/colors.dart' as colores;

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CrossPainter(),
      child: Container(),
    );
  }
}

class CrossPainter extends CustomPainter{
  
  final Paint trackPaint;
  final Paint thumbPaint;

  CrossPainter(): trackPaint = new Paint()
    ..color = colores.border
    ..style = PaintingStyle.fill,
    thumbPaint = Paint()
    ..color = colores.border
    ..style = PaintingStyle.fill;


  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(
              15.0,
              0.0,
              60.0,
              15.0
            ),
          //topLeft: Radius.circular(15.0),
          //bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        trackPaint);

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
              0.0,
              0.0,
              15.0,
              75.0
          ),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          //topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        thumbPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

//_--------------------------------------------------------------
class Controlador extends StatefulWidget {

  final double tamano;
  Controlador({this.tamano});

  @override
  _ControladorState createState() => _ControladorState();
}

class _ControladorState extends State<Controlador> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ControlPainter(control:widget.tamano),
      child: Container(
        padding: EdgeInsets.only(left: 4.0),
        child: Text("${widget.tamano} %",style: TextStyle(
            fontSize: 10.0,
            color: colores.blanco,
          ),
        ),
      ),
    );
  }
}

class ControlPainter extends CustomPainter{
  
  final Paint trackPaint;
  final Paint backPaint;
  final double control;

  ControlPainter({this.control}): trackPaint = new Paint()
    ..color = colores.accent
    ..style = PaintingStyle.fill,
    backPaint = new Paint()
    ..color = Colors.black45
    ..style = PaintingStyle.fill;


  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
              0.0,
              0.0,
              80.0,
              12.0
          ),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        backPaint);

        canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
              0.0,
              0.0,
              control,
              12.0
          ),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        trackPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}