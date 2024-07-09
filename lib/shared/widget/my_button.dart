import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.text,
    required this.onPress,
    super.key,
  });

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    // final appTextTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        text,
        // style: appTextTheme.labelSmall,
      ),
    );
  }
}
