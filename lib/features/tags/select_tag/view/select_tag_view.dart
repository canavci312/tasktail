import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/tags/add_edit_tag/view/add_edit_tag_page.dart';

import 'package:task_app/features/tags/select_tag/select_tag.dart';

class SelectTagView extends StatelessWidget {
  const SelectTagView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SelectTagCubit>();
    return BlocBuilder<SelectTagCubit, SelectTagState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Text(
                'Select tags',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(
                state.selectedTags.isNotEmpty
                    ? 'Selected tags:'
                    : 'No tags selected yet.',
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: state.selectedTags.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Chip(
                        label: Text(state.selectedTags[index].name),
                        shape: Theme.of(context)
                            .chipTheme
                            .shape
                            ?.copyWith(side: BorderSide.none),
                        backgroundColor: state.selectedTags[index].color
                            .toColor()
                            ?.withOpacity(0.9),
                        onDeleted: () =>
                            cubit.unselectTag(state.selectedTags[index]),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Your tags',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: state.tags.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (!state.selectedTags.contains(state.tags[index])) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () => cubit.selectTag(state.tags[index]),
                          child: Chip(
                            shape: Theme.of(context)
                                .chipTheme
                                .shape
                                ?.copyWith(side: BorderSide.none),
                            label: Text(state.tags[index].name),
                            backgroundColor: state.tags[index].color
                                .toColor()
                                ?.withOpacity(0.9),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => const AddEditTagPage(),
                      ),
                      child: const Text('Create tag'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () =>
                          Navigator.pop(context, state.selectedTags),
                      child: const Text('Done'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        );
      },
    );
  }
}
