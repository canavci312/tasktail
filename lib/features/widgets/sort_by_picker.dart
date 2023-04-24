import 'package:flutter/material.dart';
import 'package:task_app/domain/repositories/models/sort_by.dart';

class SortByPicker extends StatelessWidget {
  const SortByPicker({super.key});
  static Future<SortBy?> show(BuildContext context) async {
    return showDialog<SortBy?>(
      context: context,
      builder: (context) => const SortByPicker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Sort by'),
            const SizedBox(height: 12),
            for (var item in SortBy.values)
              ListTile(
                leading: Icon(item.icon),
                title: Text(item.toText()),
                onTap: () => Navigator.pop(context, item),
              ),
          ],
        ),
      ),
    );
  }
}
