import 'package:flutter/cupertino.dart';

class SymmetricTagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const double curveDepth = 12;

    path.moveTo(curveDepth, 0);

    // curva interna a sinistra
    path.quadraticBezierTo(0, size.height / 2, curveDepth, size.height);

    // lato sinistro -> basso -> dritto
    path.lineTo(size.width - curveDepth, size.height);

    // curva interna a destra
    path.quadraticBezierTo(
        size.width, size.height / 2, size.width - curveDepth, 0);

    // chiudi il path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
