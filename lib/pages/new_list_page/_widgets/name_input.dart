import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
    required this.onChanged,
    this.errorText,
  });
  final void Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) => TextFormField(
        key: const Key('listNameKey'),
        decoration: InputDecoration(
          labelText: 'List name',
          labelStyle: const TextStyle(),
          errorText: errorText,
        ),
        onChanged: onChanged,
      );
}
