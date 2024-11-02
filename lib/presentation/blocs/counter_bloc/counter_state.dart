part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({this.counter = 0, this.transactionCounter = 0});

  final int counter;
  final int transactionCounter;

  @override
  List<Object> get props => [counter, transactionCounter];

  CounterState copyWith({
    int? counter,
    int? transactionCounter,
  }) =>
      CounterState(
          counter: counter ?? this.counter,
          transactionCounter: transactionCounter ?? this.transactionCounter);
}
