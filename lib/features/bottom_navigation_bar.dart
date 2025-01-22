import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Builder(builder: (context) {
        return ClipRRect(
          // borderRadius: const BorderRadius.only(
          //   topRight: Radius.circular(30),
          //   topLeft: Radius.circular(30),
          // ),
          child: NavigationBar(
            // backgroundColor: Colors.red,
            height: 70,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            elevation: 3,
            indicatorColor: appColors.inversePrimary,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  navigationShell.currentIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                  color: navigationShell.currentIndex == 0
                      ? appColors.primary
                      : appColors.onPrimaryContainer,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  navigationShell.currentIndex == 1
                      ? Icons.language_sharp
                      : Icons.language_sharp,
                  color: navigationShell.currentIndex == 1
                      ? appColors.primary
                      : appColors.onPrimaryContainer,
                ),
                label: 'Country',
              ),
              NavigationDestination(
                icon: Icon(
                  navigationShell.currentIndex == 2
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: navigationShell.currentIndex == 3
                      ? appColors.primary
                      : appColors.onPrimaryContainer,
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
        );
      }),
    );
  }
}
