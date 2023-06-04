import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/tags/add_edit_tag/view/add_edit_tag_page.dart';

import 'package:task_app/features/tags/tag_list/tag_list.dart';

class TagListView extends StatelessWidget {
  const TagListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TagListCubit>();
    return BlocBuilder<TagListCubit, TagListState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AddEditTagPage.show(context,tag: null);
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text('Tags'),
          ),
          body: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onChanged: cubit.searchTags,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: state.tags.length,
                  itemBuilder: (context, index) {
                    final tag = state.tags[index];
                    return ListTile(
                      title: Text(tag.name),
                      onTap: () {
                        AddEditTagPage.show(context, tag: tag);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
