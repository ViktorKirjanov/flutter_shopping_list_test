import 'package:flutter/cupertino.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => CupertinoButton(
        onPressed: onPressed,
        child: const Text('Save'),
      );
}
