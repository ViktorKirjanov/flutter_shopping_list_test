import 'package:formz/formz.dart';

enum NameValidationError { long, empty }

class ShoppingListName extends FormzInput<String, NameValidationError> {
  const ShoppingListName.pure() : super.pure('');
  const ShoppingListName.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (value.trim().isNotEmpty) {
      if (value.length > 10) {
        return NameValidationError.long;
      }
      return null;
    } else {
      return NameValidationError.empty;
    }
  }
}
