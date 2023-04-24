import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/unplanned/unplanned.dart';

class UnplannedView extends StatelessWidget {
  const UnplannedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UnplannedCubit>();
    return Container(
      
    );
  }
}
