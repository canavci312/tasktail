import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/home/home.dart';
import 'package:task_app/navigation/router.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return AutoTabsScaffold(
      routes: const [
        TimelineRoute(),
        BoardRoute(),
        UnplannedRoute(),
        WorkspaceRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.timeline_outlined),
              label: 'Timeline',
            ),
            NavigationDestination(
              icon: Icon(Icons.grid_view),
              label: 'Board',
            ),
            NavigationDestination(
              icon: Icon(Icons.list_alt),
              label: 'Unplanned',
            ),
            NavigationDestination(
              icon: Icon(Icons.workspaces_outline),
              label: 'Workspace',
            ),
          ],
        );
      },
    );
  }
}
