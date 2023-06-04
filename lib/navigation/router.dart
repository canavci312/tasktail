import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/add_edit_task/view/add_edit_task_page.dart';
import 'package:task_app/features/board/view/board_page.dart';
import 'package:task_app/features/home/view/home_page.dart';
import 'package:task_app/features/note_list/view/note_list_page.dart';
import 'package:task_app/features/overdue_tasks/view/overdue_tasks_page.dart';
import 'package:task_app/features/project_settings/view/project_settings_page.dart';
import 'package:task_app/features/tags/tag_list/view/tag_list_page.dart';
import 'package:task_app/features/timeline/view/timeline_page.dart';
import 'package:task_app/features/unplanned/view/unplanned_page.dart';
import 'package:task_app/features/workspace/view/workspace_page.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: TimelineRoute.page,
            ),
            AutoRoute(page: BoardRoute.page),
            AutoRoute(page: UnplannedRoute.page),
            AutoRoute(page: WorkspaceRoute.page),
          ],
        ),
        AutoRoute(
          page: AddEditTaskRoute.page,
          path: '/add-edit-task',
        ),
        AutoRoute(
          page: ProjectSettingsRoute.page,
          path: '/project-settings',
        ),
        AutoRoute(
          page: OverdueTasksRoute.page,
          path: '/overdue-tasks',
        ),
        AutoRoute(
          page: TagListRoute.page,
          path: '/tags',
        ),
        AutoRoute(
          page: NoteListRoute.page,
          path: '/notes',
        )
      ];
}
