import 'package:flutter/material.dart';

import 'routes/app_router.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sackoba',
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.light,
      //       // darkTheme: AppTheme.dark,
      //       themeMode: ThemeMode.light,
      routerConfig: appRouter,
    );
  }
}
