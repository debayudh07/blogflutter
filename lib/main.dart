import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_blog_app/screens/blog_screen_list.dart';
import 'models/blog.dart';
import 'providers/blog_provider.dart';
import 'screens/create_blog_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BlogAdapter());
  await Hive.openBox<Blog>('blogs');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BlogProvider()),
      ],
      child: MaterialApp(
        title: 'Local Blog App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (_) => BlogListScreen(),
          '/create': (_) => CreateBlogScreen(),
        },
      ),
    );
  }
}
