import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/config/themes.dart';
import 'package:flutter_shopping_list_test/blocs/simple_bloc_observer.dart';
import 'package:flutter_shopping_list_test/pages/lists_page/lists_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shopping',
      theme: Themes.lightTheme,
      home: const ListsPage(),
    );
  }
}
