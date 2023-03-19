import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  
  static CounterCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }
  

  int age = 20;
  int weight = 50;   
  
  void increaseAge() {
    age++;
    debugPrint('age is $age');
    emit(CounterIncrement());
  }

  void decreaseAge() {
    age--;
    debugPrint('age is $age');
    emit(CounterDecremet());
  }

  void increaseWeight() {
    weight++;
    debugPrint('wieght is $weight');
    emit(CounterIncrement());
  }

  void decreaseWeight() {
    weight--;
    debugPrint('wieght is $weight');
    emit(CounterDecremet());
  }
}
