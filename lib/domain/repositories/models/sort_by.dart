import 'package:flutter/material.dart';

enum SortBy {
  dueDateDesc,
  dueDateAsc,
  name,
  priority,
  createdDateAsc,
  createdDateDesc,
  manual;

  IconData get icon {
    switch (this) {
      case SortBy.dueDateDesc:
        return Icons.arrow_downward;
      case SortBy.dueDateAsc:
        return Icons.arrow_upward;
      case SortBy.name:
        return Icons.sort_by_alpha;
      case SortBy.priority:
        return Icons.flag_outlined;
      case SortBy.createdDateAsc:
        return Icons.arrow_upward;
      case SortBy.createdDateDesc:
        return Icons.arrow_downward;
      case SortBy.manual:
        return Icons.drag_handle;
    }
  }

  String toText() {
    switch (this) {
      case SortBy.dueDateDesc:
        return 'Due date desc';
      case SortBy.dueDateAsc:
        return 'Due date asc';
      case SortBy.name:
        return 'Name';
      case SortBy.priority:
        return 'Priority';
      case SortBy.createdDateAsc:
        return 'Created date asc';
      case SortBy.createdDateDesc:
        return 'Created date desc';
      case SortBy.manual:
        return 'Manual';
    }
  }
}
