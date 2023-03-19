import 'package:bmi_app/bussiness_logic/cubit/counter_cubit.dart';
import 'package:bmi_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'comp/components.dart';
import 'constants/color_pick.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IBM APP',
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}
