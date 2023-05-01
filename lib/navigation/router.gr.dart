// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    BoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BoardPage(),
      );
    },
    WorkspaceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkspacePage(),
      );
    },
    UnplannedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnplannedPage(),
      );
    },
    ProjectSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectSettingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProjectSettingsPage(
          args.project,
          key: args.key,
        ),
      );
    },
    AddEditTaskRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditTaskRouteArgs>(
          orElse: () => const AddEditTaskRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddEditTaskPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
    TimelineRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TimelinePage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BoardPage]
class BoardRoute extends PageRouteInfo<void> {
  const BoardRoute({List<PageRouteInfo>? children})
      : super(
          BoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkspacePage]
class WorkspaceRoute extends PageRouteInfo<void> {
  const WorkspaceRoute({List<PageRouteInfo>? children})
      : super(
          WorkspaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkspaceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UnplannedPage]
class UnplannedRoute extends PageRouteInfo<void> {
  const UnplannedRoute({List<PageRouteInfo>? children})
      : super(
          UnplannedRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnplannedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectSettingsPage]
class ProjectSettingsRoute extends PageRouteInfo<ProjectSettingsRouteArgs> {
  ProjectSettingsRoute({
    required Project project,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectSettingsRoute.name,
          args: ProjectSettingsRouteArgs(
            project: project,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectSettingsRoute';

  static const PageInfo<ProjectSettingsRouteArgs> page =
      PageInfo<ProjectSettingsRouteArgs>(name);
}

class ProjectSettingsRouteArgs {
  const ProjectSettingsRouteArgs({
    required this.project,
    this.key,
  });

  final Project project;

  final Key? key;

  @override
  String toString() {
    return 'ProjectSettingsRouteArgs{project: $project, key: $key}';
  }
}

/// generated route for
/// [AddEditTaskPage]
class AddEditTaskRoute extends PageRouteInfo<AddEditTaskRouteArgs> {
  AddEditTaskRoute({
    Key? key,
    Task? task,
    List<PageRouteInfo>? children,
  }) : super(
          AddEditTaskRoute.name,
          args: AddEditTaskRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEditTaskRoute';

  static const PageInfo<AddEditTaskRouteArgs> page =
      PageInfo<AddEditTaskRouteArgs>(name);
}

class AddEditTaskRouteArgs {
  const AddEditTaskRouteArgs({
    this.key,
    this.task,
  });

  final Key? key;

  final Task? task;

  @override
  String toString() {
    return 'AddEditTaskRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [TimelinePage]
class TimelineRoute extends PageRouteInfo<void> {
  const TimelineRoute({List<PageRouteInfo>? children})
      : super(
          TimelineRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimelineRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
