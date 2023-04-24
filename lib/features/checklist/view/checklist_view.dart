import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/checklist_item.dart';

import 'package:task_app/features/checklist/checklist.dart';

class ChecklistView extends StatelessWidget {
  const ChecklistView({
    super.key,
    required this.onListChanged,
    required this.items,
  });
  final void Function(List<CheckListItem> items) onListChanged;
  final List<CheckListItem> items;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChecklistCubit>();
    return BlocBuilder<ChecklistCubit, ChecklistState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return CheckboxListTile(
              value: item.isCompleted,
              onChanged: (value) {},
              key: UniqueKey(),
              title: Row(
                children: [
                  const Icon(Icons.drag_indicator_outlined),
                  Text(item.title),
                ],
              ),
            );
          },
          onReorder: (oldIndex, newIndex) {
            cubit.reorderItems(oldIndex, newIndex);
            onListChanged(cubit.state.items);
          },
        );
      },
    );
  }
}
