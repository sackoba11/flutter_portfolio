import 'dart:ui';

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
      extendBody: true,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            stretch: true,
            pinned: true,
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
              onHireTap: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground, // Floute l'arrière-plan au scroll
                StretchMode.fadeTitle, // Fait disparaître/apparaître en douceur
              ],
              background: Container(
                height: 80,
                width: double.infinity,
                color: Colors.black,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true, // true si le contenu de navigationShell défile
            child: widget.navigationShell,
          ),
        ],
      ),
      //  widget.navigationShell,
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
