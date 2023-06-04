import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaskMoreBottomSheet extends StatelessWidget {
  const TaskMoreBottomSheet({required this.isNote, super.key});
  static Future<TaskMoreResult?> show(
    BuildContext context, {
    required bool isNote,
  }) async {
    return showModalBottomSheet<TaskMoreResult?>(
      context: context,
      builder: (context) => TaskMoreBottomSheet(
        isNote: isNote,
      ),
      showDragHandle: true,
    );
  }

  final bool isNote;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.check_outlined),
          title: const Text('Mark as done'),
          onTap: () {
            Navigator.pop(context, TaskMoreResult.markAsDone);
          },
        ),
        Visibility(
          visible: Platform.isAndroid && !kIsWeb,
          child: ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Pin as notification'),
            onTap: () {
              Navigator.pop(context, TaskMoreResult.pinAsNotification);
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.swap_horiz_outlined),
          title: isNote
              ? const Text('Convert to task')
              : const Text('Convert to note'),
          onTap: () {
            Navigator.pop(context, TaskMoreResult.convertToNote);
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete_outline_outlined),
          title: const Text('Delete'),
          onTap: () {
            Navigator.pop(context, TaskMoreResult.delete);
          },
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}

enum TaskMoreResult {
  markAsDone,
  pinAsNotification,
  convertToNote,
  delete,
}
