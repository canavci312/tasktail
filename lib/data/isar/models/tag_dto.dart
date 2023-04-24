import 'package:isar/isar.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
part 'tag_dto.g.dart';

@collection
class TagDto {
  TagDto({
    required this.name,
    this.color = TagColor.noColor,
  });
  factory TagDto.fromDomainModel(Tag tag) {
    return TagDto(
      name: tag.name,
      color: tag.color,
    );
  }
  Id? id;
  final String name;
  @enumerated
  final TagColor color;

  //from domain model
  Tag toDomainModel() {
    return Tag(
      name: name,
      color: color,
    );
  }
}
