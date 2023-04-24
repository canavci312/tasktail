import 'package:isar/isar.dart';
import 'package:task_app/domain/repositories/models/checklist_item.dart';
part 'checklist_item_dto.g.dart';

@embedded
class CheckListItemDto {
  CheckListItemDto({this.title, this.isCompleted});
  factory CheckListItemDto.fromDomainModel(CheckListItem item) {
    return CheckListItemDto(
      title: item.title,
      isCompleted: item.isCompleted,
    );
  }
  final String? title;
  final bool? isCompleted;

  // from to domain model
  CheckListItem toDomainModel() {
    return CheckListItem(
      title: title!,
      isCompleted: isCompleted!,
    );
  }
}
