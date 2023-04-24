import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/add_edit_project/add_edit_project.dart';
import 'package:task_app/features/widgets/color_picker.dart';

class AddEditProjectView extends StatelessWidget {
  const AddEditProjectView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddEditProjectCubit>();
    return BlocBuilder<AddEditProjectCubit, AddEditProjectState>(
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      if (state.color != null)
                        InkWell(
                          onTap: () => onColorPressed(context),
                          child: Icon(
                            Icons.circle,
                            color: state.color?.toColor(),
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
                          onChanged: cubit.changeName,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Project name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          cubit.saveProject();
                          Navigator.pop(context);
                        },
                        child: const Text('Done'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> onColorPressed(BuildContext context) async {
    final result = await ColorPicker.show(context);
    if (result != null && context.mounted) {
      context.read<AddEditProjectCubit>().changeColor(result);
    }
  }
}
