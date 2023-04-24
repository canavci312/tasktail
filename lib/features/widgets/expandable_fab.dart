import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:task_app/features/add_edit_project/view/add_edit_project_page.dart';
import 'package:task_app/navigation/router.dart';

class AppExpandableFab extends StatelessWidget {
  AppExpandableFab({super.key});
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      key: _key,
      child: const Icon(Icons.add),
      children: [
        FloatingActionButton.extended(
          heroTag: null,
          onPressed: () {
            _key.currentState!.toggle();
            showModalBottomSheet<void>(
              context: context,
              builder: (context) => const AddEditProjectPage(),
            );
          },
          extendedPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          label: const Text('Project'),
        ),
        FloatingActionButton.extended(
          heroTag: null,
          onPressed: () {
            _key.currentState!.toggle();

            context.router.push(AddEditTaskRoute());
          },
          extendedPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          label: const Text('Task'),
        ),
        FloatingActionButton.extended(
          heroTag: null,
          onPressed: () {
            _key.currentState!.toggle();
          },
          extendedPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          label: const Text('Note'),
        ),
      ],
    );
  }
}
