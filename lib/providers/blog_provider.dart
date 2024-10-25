import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/blog.dart';

class BlogProvider with ChangeNotifier {
  final Box<Blog> _blogBox = Hive.box<Blog>('blogs');

  List<Blog> get blogs => _blogBox.values.toList();

  void addBlog(Blog blog) {
    _blogBox.add(blog);
    notifyListeners();
  }
}
