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
              ? Matrix4.identity().scaled(0.90, 0.90, 0.40)
              : Matrix4.identity(),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 1, 0.004)
              ..rotateX(0.0)
              ..rotateY(0.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.black45,
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(24),
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
