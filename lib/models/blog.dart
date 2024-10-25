import 'package:hive/hive.dart';

part 'blog.g.dart';

@HiveType(typeId: 0)
class Blog extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime createdAt;

  Blog({required this.title, required this.content, required this.createdAt});
}
