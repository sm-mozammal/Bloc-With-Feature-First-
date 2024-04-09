import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  const CounterState({this.count = 0});

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  @override
  List<Object> get props => [count];
}

// class CounterInitial extends CounterState {
//   final int count;
//   const CounterInitial({this.count = 0});

//   // CounterInitial copyWith({int? count}) {
//   //   return CounterInitial(count: count ?? this.count);
//   // }

//   @override
//   List<Object> get props => [count];
// }
