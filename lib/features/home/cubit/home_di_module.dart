import 'package:flutter/material.dart';
import 'package:nitro_services/nitro_services.dart';

class HomeDIModule implements DIModule {
  @override
  Future<void> register() async {
    DI.registerLazySingleton<ClassA>(ClassA.new);
    DI.registerSingleton<ClassB>(ClassB());
    await DI.waitInitialized();
  }
}

class ClassA {
  void doSomething() {
    debugPrint('doSomething method called');
  }
}

class ClassB {}
