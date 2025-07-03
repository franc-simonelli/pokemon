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
          image: DecorationImage(
            image: AssetImage('assets/images/metal_black.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54,
              BlendMode.darken,
            ),
          ),
        ),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color(0xFF1C1C1C),
        //       Color(0xFF2B2B2B),
        //       Color(0xFF3A3A3A),
        //       Color(0xFF1A1A1A),
        //       Color(0xFF101010),
        //     ],
        //   ),
        // ),
        child: body,
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return navigationBar ?? SizedBox.shrink();
      }),
    );
  }
}
