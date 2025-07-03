import 'package:flutter/material.dart';

class ButtonScaled extends StatefulWidget {
  const ButtonScaled({
    required this.child,
    required this.onPress,
    super.key,
  });

  final Widget child;
  final Function onPress;

  @override
  State<ButtonScaled> createState() => _ButtonScaledState();
}

class _ButtonScaledState extends State<ButtonScaled> {
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
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: _isPressed ? 0.7 : 1,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 70),
          curve: Curves.easeInOut,
          transformAlignment: Alignment.center,
          transform: _isPressed
              ? Matrix4.identity().scaled(0.95, 0.95)
              : Matrix4.identity(),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF232526),
                  Color(0xFF414345),
                  Color(0xFF232526),
                ],
              ),
              border: Border.all(color: Colors.grey.shade800),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.08),
                  blurRadius: 2,
                  offset: const Offset(-2, -2),
                  spreadRadius: -2,
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
