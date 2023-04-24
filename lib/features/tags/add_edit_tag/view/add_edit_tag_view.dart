import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

import 'package:task_app/features/tags/add_edit_tag/add_edit_tag.dart';
import 'package:task_app/features/widgets/color_picker.dart';

class AddEditTagView extends StatelessWidget {
  AddEditTagView({
    super.key,
  });
  //initilize formkey
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddEditTagCubit>();
    return BlocBuilder<AddEditTagCubit, AddEditTagState>(
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
                      if (state.color != TagColor.noColor)
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
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (value) {
                              return value != null && value.isNotEmpty
                                  ? null
                                  : 'Tag name cannot be empty';
                            },
                            onChanged: cubit.changeName,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Tag name',
                            ),
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
                          if (_formKey.currentState!.validate()) {
                            cubit.saveTag();
                            Navigator.of(context).pop();
                          }
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
      context.read<AddEditTagCubit>().changeColor(result);
    }
  }
}
