import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_app/counter/cubit/counter_cubit.dart';
import 'package:tutorial_app/counter/view/counter_view.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (_) => CounterCubit(),
    child: CounterView(),
      
    );
  }
}