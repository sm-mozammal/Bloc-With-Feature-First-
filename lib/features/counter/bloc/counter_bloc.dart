import 'package:bloc_practice/features/counter/bloc/counter_event.dart';
import 'package:bloc_practice/features/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(increment);
    on<DecrementEvent>(decrement);
  }

  void increment(IncrementEvent event, Emitter<CounterState> emit) {
    // final currentState = state as CounterInitial;
    // final updatedCount = currentState.count + 1;
    emit(state.copyWith(count: state.count + 1));
  }

  void decrement(DecrementEvent event, Emitter<CounterState> emit) {
    // final currentState = state as CounterInitial;
    // final updatedCount = currentState.count - 1;
    if (state.count > 0) {
      emit(state.copyWith(count: state.count - 1));
    }
  }
}
