import 'package:flutter/material.dart';
import 'dart:math';
import '../constants/color_pick.dart';

class MyResultPage extends StatelessWidget {
  
  final bool gender;
  final double height;
  final int weight;
  final int age;

  MyResultPage({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        iconTheme: const IconThemeData(color: textColor),
        centerTitle: true,
        title: const Text(
          'CALCULATION',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Text( 
              'GENDER: ${gender? 'Male': 'Female'}',
              style: const TextStyle(color: textColor, fontSize: 20,),
            ),
            Text(
              'HIGHT: $height',
              style: const TextStyle(color: textColor, fontSize: 20,),
            ),
            Text(
              'WEIGHT: $weight',
              style: const TextStyle(color: textColor, fontSize: 20,),
            ),
            Text(
              'AGE: $age',
              style: const TextStyle(color: textColor, fontSize: 20,),
            ),
            Text(
              'THE BMI RESULT: ${(weight/pow(height/100,2)).toStringAsFixed(2)}',
              style: const TextStyle(color: textColor, fontSize: 20,),
            ),
          ],
        ),
      ),
    );
  }
}