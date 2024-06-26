import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/app/blocs/cubit/theme_cubit.dart';
import 'package:task_app/app/view/color_schemes.dart';
import 'package:task_app/l10n/l10n.dart';
import 'package:task_app/locator.dart';
import 'package:task_app/navigation/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(getIt()),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            key: ValueKey(state),
            themeMode: state,
            theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
            darkTheme:
                ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: getIt<AppRouter>().config(),
          );
        },
      ),
    );
  }
}
