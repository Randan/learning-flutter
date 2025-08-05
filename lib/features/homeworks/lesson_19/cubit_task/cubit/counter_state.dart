class CounterCubitState {
  CounterCubitState({required this.counter});

  final int counter;

  CounterCubitState copyWith({int? counter}) {
    return CounterCubitState(counter: counter ?? this.counter);
  }
}
