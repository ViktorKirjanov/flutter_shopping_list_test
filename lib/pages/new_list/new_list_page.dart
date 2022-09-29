import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '_widgets/background_item.dart';

class NewListPage extends StatelessWidget {
  const NewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New list'),
        actions: [
          CupertinoButton(child: const Text('Save'), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'List name',
                labelStyle: TextStyle(),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              mainAxisExtent: 100,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext ctx, index) {
              return BackgroundItem(
                bacground: 'assets/images/group_${index + 1}.jpg',
                isSelected: index == 2,
              );
            },
          ),
        ],
      ),
    );
  }
}
