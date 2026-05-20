import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:material_symbols_icons/symbols.dart';

import '../widgets/header.dart';

class MainShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  static const _navSections = ['Home', 'Projects', 'Stack', 'About', 'Contact'];

  void goTo(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void goToSection(String section) {
    final index = _navSections.indexOf(section);
    if (index >= 0) {
      goTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;
    final activeSection = _navSections[widget.navigationShell.currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        titleSpacing: 0,
        title: Header(
          isMobile: isMobile,
          activeSection: activeSection,
          sections: _navSections,
          onSectionTap: goToSection,
          onHireTap: () {
            print("vbevbe");
          },
        ),
      ),
      body: widget.navigationShell,
      bottomNavigationBar:
          isMobile
              ? NavigationBar(
                elevation: 5,
                indicatorColor: Colors.transparent,
                selectedIndex: widget.navigationShell.currentIndex,
                onDestinationSelected: goTo,
                labelTextStyle: WidgetStateTextStyle.resolveWith((
                  Set<WidgetState> states,
                ) {
                  final TextStyle textStyle =
                      states.contains(WidgetState.selected)
                          ? const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )
                          : const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          );
                  return textStyle;
                }),
                destinations: [
                  NavigationDestination(
                    icon: const Icon(Icons.home_filled),
                    label: 'Accueil',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.manage_accounts_rounded),
                    label: 'Projects',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.agriculture),
                    label: 'Stack',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.person),
                    label: 'About',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.person),
                    label: 'Contact',
                  ),
                ],
              )
              : null,
    );
  }
}
