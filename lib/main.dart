import 'package:flutter/material.dart';
import 'src/di/bloc_injector.dart';
import 'src/di/bloc_module.dart';

import 'dart:async';

void main() async {
  var container = await BlocInjector.create(BlocModule());

  runZoned<Future<Null>>(() async {
    runApp(container.app);
  }, onError: (error, stackTrace) async {
    debugPrint(error.toString());
  });
}
