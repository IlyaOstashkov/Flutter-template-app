import 'package:bloc/bloc.dart';
import 'package:nitro_services/nitro_services.dart';
import 'home_di_module.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  final _classA = DI.get<ClassA>();

  void increment() {
    _classA.doSomething();
    emit(state + 1);
  }

  void decrement() => emit(state - 1);
}
