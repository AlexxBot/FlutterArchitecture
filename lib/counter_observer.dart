import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver{

  //esta clase gestiona todos los cambios

  /// {@template counter_observer}
  /// [BlocObserver] for the counter application which
  /// observes all [Cubit] state changes.
  /// {@endtemplate}
  @override 
  void onChange(Cubit cubit, Change change){
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}