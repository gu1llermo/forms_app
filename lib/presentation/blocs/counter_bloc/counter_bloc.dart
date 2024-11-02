import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    // Cuando se ejecute un evento de tipo CounterIncreased, ejecuta éste handler
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        // ésta es la emisión del nuevo evento
        counter: state.counter +
            event.value, // el evento tiene el value que se especificó
        transactionCounter: state.transactionCounter + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      // ésta es la emisión del nuevo evento
      counter: 0, // el evento tiene el value que se especificó
    ));
  }

  void increaseBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  void resetCounter() {
    add(const CounterReset());
  }
}
