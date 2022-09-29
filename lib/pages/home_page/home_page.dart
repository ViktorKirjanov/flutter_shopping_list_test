import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/pages/new_list/new_list_page.dart';

import '_widgets/add_button.dart';
import '_widgets/shopping_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping list")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ShoppingListItem(
            title: 'Daily meals',
            count: 10,
            background: 'assets/images/group_1.jpg',
          ),
          const ShoppingListItem(
            title: 'Weekend party',
            count: 1,
            background: 'assets/images/group_3.jpg',
          ),
          SafeArea(
            child: AddButton(
              onTap: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute<bool>(
                  builder: (BuildContext context) => const NewListPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
