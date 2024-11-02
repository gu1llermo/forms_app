import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // éste es nuestro manejador de estado
  CounterCubit() : super(const CounterState());

  void increaseBy(int value) {
    // emite un nuevo estado
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
