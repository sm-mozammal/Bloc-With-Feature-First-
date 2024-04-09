import 'package:bloc_practice/features/counter/bloc/counter_bloc.dart';
import 'package:bloc_practice/features/counter/bloc/counter_event.dart';
import 'package:bloc_practice/features/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.count.toString(),
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Icon(Icons.add)),
              SizedBox(width: 40.w),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
