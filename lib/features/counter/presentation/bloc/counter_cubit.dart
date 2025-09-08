import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitState(counter: 0));

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
