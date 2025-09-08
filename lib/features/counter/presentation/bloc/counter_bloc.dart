import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_event.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<CounterIncrementEvent>(
      (event, emit) => emit(state.copyWith(counter: state.counter + 1)),
    );

    on<CounterDecrementEvent>(
      (event, emit) => emit(state.copyWith(counter: state.counter - 1)),
    );

    on<CounterResetEvent>((event, emit) => emit(state.copyWith(counter: 0)));
  }
}
