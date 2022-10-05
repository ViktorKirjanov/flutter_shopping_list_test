import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final Function onChanged;
  final String? errorText;

  const NameInput({
    super.key,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('listNameKey'),
      decoration: InputDecoration(
        labelText: 'List name',
        labelStyle: const TextStyle(),
        errorText: errorText,
      ),
      onChanged: (val) => onChanged(val),
    );
  }
}
