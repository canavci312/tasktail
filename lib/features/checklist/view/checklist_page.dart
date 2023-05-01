import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/checklist_item.dart';
import 'package:task_app/features/checklist/checklist.dart';
import 'package:task_app/features/checklist/view/checklist_view.dart';

class ChecklistPage extends StatelessWidget {
  const ChecklistPage({
    required this.items,
    required this.onListChanged,
    super.key,
  });
  final List<CheckListItem> items;
  final void Function(List<CheckListItem> items) onListChanged;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChecklistCubit(items),
      child: ChecklistView(
        items: items,
        onListChanged: onListChanged,
      ),
    );
  }
}
