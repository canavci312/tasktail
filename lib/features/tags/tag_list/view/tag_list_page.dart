import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/tags/tag_list/tag_list.dart';
import 'package:task_app/features/tags/tag_list/view/tag_list_view.dart';
import 'package:task_app/locator.dart';

@RoutePage()
class TagListPage extends StatelessWidget {
  const TagListPage({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TagListCubit(getIt())..listenTags(),
      child: const TagListView(),
    );
  }
}
