import 'package:flutter/material.dart';

class IconScaled extends StatefulWidget {
  const IconScaled({
    required this.icon,
    required this.onPress,
    super.key,
  });

  final Icon icon;
  final VoidCallback onPress;

  @override
  State<IconScaled> createState() => _IconScaledState();
}

class _IconScaledState extends State<IconScaled> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isPressed = true;
        });
        await Future.delayed(Duration(milliseconds: 70));
        setState(() {
          _isPressed = false;
        });
        await Future.delayed(Duration(milliseconds: 70));
        widget.onPress();
      },
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 70),
        curve: Curves.easeInOut,
        transformAlignment: Alignment.center,
        transform: _isPressed
            ? Matrix4.identity().scaled(0.5, 0.5)
            : Matrix4.identity(),
        child: widget.icon,
      ),
    );
  }
}
