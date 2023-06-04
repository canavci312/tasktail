import 'package:flutter/material.dart';
import 'package:task_app/app/app.dart';
import 'package:task_app/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const App());
}
