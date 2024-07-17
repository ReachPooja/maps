import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maps/app/app.dart';
import 'package:maps/app/bootstrap.dart';
import 'package:maps/app/injector/injector.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureInjector();
      await bootstrap(MainApp.new);
    },
    (error, stack) {
      log(error.toString(), stackTrace: stack);
    },
  );
}
