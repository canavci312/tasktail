import 'package:flutter/material.dart';
import 'package:task_app/app/view/color_schemes.dart';
import 'package:task_app/l10n/l10n.dart';
import 'package:task_app/locator.dart';
import 'package:task_app/navigation/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
