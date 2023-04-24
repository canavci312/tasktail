import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

import 'package:task_app/features/tags/select_tag/select_tag.dart';
import 'package:task_app/features/tags/select_tag/view/select_tag_view.dart';
import 'package:task_app/locator.dart';

class SelectTagPage extends StatelessWidget {
  const SelectTagPage({
    super.key,
    this.alreadySelected,
  });
  final List<Tag>? alreadySelected;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SelectTagCubit(getIt(), alreadySelected)..listenTags(),
      child: const SelectTagView(),
    );
  }
}
