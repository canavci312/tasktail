import 'package:isar/isar.dart';
import 'package:task_app/data/isar/models/tag_dto.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

class TagRepository {
  TagRepository({required this.isar});
  final Isar isar;
  Stream<List<Tag>> listenTags() {
    return isar
        .collection<TagDto>()
        .buildQuery<TagDto>()
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  List<Tag> getTags() {
    return isar
        .collection<TagDto>()
        .buildQuery<TagDto>()
        .findAllSync()
        .map((e) => e.toDomainModel())
        .toList();
  }

  Future<int> insertTag(Tag tag) async {
    return isar.writeTxnSync(
      () => isar.collection<TagDto>().putSync(TagDto.fromDomainModel(tag)),
    );
  }

  Future<int> updateTag(Tag tag) async {
    return isar.writeTxnSync(
      () => isar.collection<TagDto>().putSync(TagDto.fromDomainModel(tag)),
    );
  }

  Future<bool> deleteTag(int id) async {
    return isar.writeTxnSync(() => isar.collection<TagDto>().deleteSync(id));
  }
}
