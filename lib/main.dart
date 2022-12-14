import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/simple_bloc_observer.dart';
import 'package:flutter_shopping_list_test/config/app_routes.dart';
import 'package:flutter_shopping_list_test/config/custom_theme.dart';
import 'package:flutter_shopping_list_test/data/firebase_shopping_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (context) =>
          ListsBloc(FirebaseShoppingRepository())..add(const GetListsEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: routes,
        theme: CustomTheme.lightTheme,
        title: 'Flutter Shopping',
      );
}
