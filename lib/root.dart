import 'package:flutter/material.dart';

import 'views/home/views/home_screen.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sacko A. B. Portfolio',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
