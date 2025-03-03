import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/bottom_navigation_bar/widgets/glow_icon.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Builder(builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40.0,
              sigmaY: 40.0,
            ),
            child: Container(
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
                height: 70,
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
        );
      }),
    );
  }
}
