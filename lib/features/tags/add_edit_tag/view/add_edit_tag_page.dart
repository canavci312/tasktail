import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

import 'package:task_app/features/tags/add_edit_tag/add_edit_tag.dart';
import 'package:task_app/features/tags/add_edit_tag/view/add_edit_tag_view.dart';
import 'package:task_app/locator.dart';

class AddEditTagPage extends StatelessWidget {
  const AddEditTagPage({
    super.key,
    this.tag,
  });
  static Future<void> show(BuildContext context, {required Tag? tag}) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) => AddEditTagPage(
        tag: tag,
      ),
    );
  }

  final Tag? tag;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEditTagCubit(tag, getIt()),
      child: AddEditTagView(),
    );
  }
}
