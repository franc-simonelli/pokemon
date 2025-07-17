import 'package:flutter/material.dart';

class PkmScaffold extends StatelessWidget {
  const PkmScaffold({
    required this.body,
    this.appBar,
    this.navigationBar,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? navigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/metal_black.png'),
            //   fit: BoxFit.cover,
            //   colorFilter: ColorFilter.mode(
            //     Colors.black54,
            //     BlendMode.darken,
            //   ),
            // ),
            ),
        child: body,
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return navigationBar ?? SizedBox.shrink();
      }),
    );
  }
}
