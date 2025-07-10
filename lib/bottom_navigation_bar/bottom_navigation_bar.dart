import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/bottom_navigation_bar/widgets/glow_icon.dart';
import 'package:pokedex/shared/widget/pkm_scaffold.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return PkmScaffold(
      body: navigationShell,
      navigationBar: Builder(builder: (context) {
        return _buildBottomNavigationBar(context);
      }),
    );
    // return Scaffold(
    //   backgroundColor: Colors.transparent,
    //   extendBody: true,
    //   extendBodyBehindAppBar: true,
    //   body: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //         colors: [
    //           Color(0xFF1C1C1C),
    //           Color(0xFF2B2B2B),
    //           Color(0xFF3A3A3A),
    //           Color(0xFF1A1A1A),
    //           Color(0xFF101010),
    //         ],
    //       ),
    //     ),
    //     child: navigationShell,
    //   ),
    //   bottomNavigationBar: Builder(builder: (context) {
    //     return _buildBottomNavigationBar(context);
    //   }),
    // );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return AnimatedSlide(
      offset: Offset.zero,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 40,
            sigmaY: 40,
          ),
          child: SafeArea(
            bottom: false,
            top: false,
            left: false,
            right: false,
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              height: 60 + max(MediaQuery.of(context).padding.bottom, 16.0),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 2.0,
                  ),
                ),
              ),
              child: NavigationBar(
                indicatorColor: Colors.blueGrey.shade800,
                backgroundColor: Colors.transparent,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                elevation: 3,
                destinations: [
                  NavigationDestination(
                    icon: GlowIcon(
                      navigationShell.currentIndex == 0
                          ? Icons.catching_pokemon
                          : Icons.catching_pokemon_outlined,
                    ),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: GlowIcon(
                      navigationShell.currentIndex == 1
                          ? Icons.language_sharp
                          : Icons.language_sharp,
                    ),
                    label: 'Country',
                  ),
                  NavigationDestination(
                    icon: GlowIcon(
                      navigationShell.currentIndex == 2
                          ? Icons.compare_arrows_outlined
                          : Icons.compare_arrows_outlined,
                    ),
                    label: 'Compare',
                  ),
                  NavigationDestination(
                    icon: GlowIcon(
                      navigationShell.currentIndex == 3
                          ? Icons.favorite_outline
                          : Icons.favorite_outline,
                      // color: navigationShell.currentIndex == 3
                      //     ? appColors.primary
                      //     : appColors.onPrimaryContainer,
                    ),
                    label: 'Favorite',
                  ),
                ],
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
