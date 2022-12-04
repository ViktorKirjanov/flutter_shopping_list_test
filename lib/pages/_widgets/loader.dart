import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator();
    } else {
      return const SizedBox(
        height: 25.0,
        width: 25.0,
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      );
    }
  }
}
