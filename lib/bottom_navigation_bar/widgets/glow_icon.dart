import 'package:flutter/material.dart';

class GlowIcon extends StatelessWidget {
  final IconData icon;

  const GlowIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          colors: [
            Colors.grey.shade400,
            Colors.blueGrey,
          ],
          stops: [0.4, 1],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: Icon(icon, size: 30, color: Colors.white),
    );
  }
}
