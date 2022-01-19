import 'package:get_it/get_it.dart';

abstract class DIModule {
  Future<void> register();
}

class DI {
  static final _serviceLocator = GetIt.I;

  static Future<void> reset({required bool dispose}) {
    return _serviceLocator.reset(dispose: dispose);
  }

  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _serviceLocator.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  static void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    _serviceLocator.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  static void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    _serviceLocator.registerSingleton(
      instance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: dispose,
    );
  }

  static void registerFactoryParam<T extends Object, P1, P2>(
    FactoryFuncParam<T, P1, P2> factoryFunc, {
    String? instanceName,
  }) {
    _serviceLocator.registerFactoryParam(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  static Future<void> registerModules({required List<DIModule> modules}) {
    return Future.forEach<DIModule>(modules, (m) => m.register());
  }

  static Future<void> waitInitialized() {
    return _serviceLocator.allReady();
  }
}
