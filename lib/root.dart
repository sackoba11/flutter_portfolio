import 'package:flutter/material.dart';

import 'views/about/views/about_screen.dart';
import 'views/home/views/home_screen.dart';
import 'views/projects/views/projects_screen.dart';
import 'views/stack/views/stack_screen.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sacko A. B. Portfolio',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/projects': (context) => const ProjectsScreen(),
        '/stack': (context) => const StackScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
