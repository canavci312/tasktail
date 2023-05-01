import 'package:flutter/material.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
import 'package:task_app/features/widgets/color_picker.dart';

class DuplicateDialog extends StatefulWidget {
  const DuplicateDialog({
    required this.project,
    super.key,
  });
  final Project project;

  @override
  State<DuplicateDialog> createState() => _DuplicateDialogState();
}

class _DuplicateDialogState extends State<DuplicateDialog> {
  final TextEditingController controller = TextEditingController();
  late Project dubProject;
  @override
  void initState() {
    dubProject = widget.project
        .copyWith(id: null, title: '${widget.project.title} (Copy)');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Duplicate project'),
          Row(
            children: [
              if (widget.project.color != TagColor.noColor)
                InkWell(
                  onTap: () => onColorPressed(context),
                  child: Icon(
                    Icons.circle,
                    color: dubProject.color.toColor(),
                  ),
                )
              else
                InkWell(
                  onTap: () => onColorPressed(context),
                  child: const Icon(
                    Icons.format_color_reset_outlined,
                  ),
                ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Project name',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, dubProject);
          },
          child: const Text('Duplicate'),
        ),
      ],
    );
  }

  Future<void> onColorPressed(BuildContext context) async {
    final result = await ColorPicker.show(context);
    if (result != null && context.mounted) {
      setState(() {
        dubProject = dubProject.copyWith(color: result);
      });
    }
  }
}
