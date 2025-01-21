import 'package:flutter/material.dart';

class ContentModalWidget extends StatelessWidget {
  const ContentModalWidget({super.key, this.title, required this.child});

  final Widget? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 3,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: theme.splashColor)),
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 8,
            ),
            child: title,
          ),
          child
        ],
      ),
    );
  }
}
