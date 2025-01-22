import 'package:flutter/material.dart';

class CardScaled extends StatefulWidget {
  const CardScaled({
    required this.child,
    required this.decorationCard,
    this.onPress,
    super.key,
  });

  final Widget child;
  final BoxDecoration decorationCard;
  final Function? onPress;

  @override
  State<CardScaled> createState() => _CardScaledState();
}

class _CardScaledState extends State<CardScaled> {
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
        widget.onPress!();
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
          transform: _isPressed
              ? Matrix4.identity().scaled(0.90, 0.90, 0.40)
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          decoration: widget.decorationCard,
          child: widget.child,
        ),
      ),
    );
  }
}
