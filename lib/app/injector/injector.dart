import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:maps/app/injector/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureInjector() => getIt.init();
