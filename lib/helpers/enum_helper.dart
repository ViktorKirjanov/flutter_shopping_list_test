import 'package:collection/collection.dart';

extension EnumHelper on String {
  static T? enumFromString<T>(Iterable<T> values, String value) {
    return values
        .firstWhereOrNull((type) => type.toString().split(".").last == value);
  }

  static String enumToString(Object o) => o.toString().split('.').last;
}
