import 'package:flutter/cupertino.dart';

class SaveButton extends StatelessWidget {
  final Function onPressed;

  const SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text('Save'),
      onPressed: () => onPressed(),
    );
  }
}
