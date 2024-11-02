part of 'counter_cubit.dart';

// sealed class CounterState {}

// final class CounterInitial extends CounterState {}

class CounterState extends Equatable {
  // aquí colocamos como uno quiere que luzca nuestro estado
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  // tenemos que crearnos una copia de éste estado

  CounterState copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount);

  @override
  List<Object> get props => [counter, transactionCount];
}
