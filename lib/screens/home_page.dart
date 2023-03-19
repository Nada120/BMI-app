import 'package:bmi_app/screens/resualt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bussiness_logic/cubit/counter_cubit.dart';
import '../comp/components.dart';
import '../constants/color_pick.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  double height = 120;
  bool isMale = false;

  Widget myBodyWidget(double width) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CounterCubit.get(context);
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyContainerImage(
                          process: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          text: 'Male',
                          icon: Icons.male_outlined,
                          backColor: (isMale) ? selectedColor : containerColor,
                          textcolor: (isMale) ? Colors.white : textColor,
                        ),
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      Expanded(
                        child: MyContainerImage(
                          process: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          text: 'Female',
                          icon: Icons.female_outlined,
                          backColor: (!isMale) ? selectedColor : containerColor,
                          textcolor: (!isMale) ? Colors.white : textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: containerColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HIGHT',
                        style: TextStyle(color: textColor, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'cm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        max: 200,
                        min: 40,
                        thumbColor: const Color(0xFF009999),
                        activeColor: const Color(0xFF00cccc),
                        secondaryActiveColor: const Color(0xFF009999),
                        onChanged: (value) {
                          setState(() {
                            height = value.floorToDouble();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyContainerCal(
                          heroName1: 'b1',
                          heroName2: 'b2',
                          text: 'WEIGHT',
                          data: cubit.weight.toString(),
                          processOne: () {
                            cubit.increaseWeight();
                          },
                          processTwo: () {
                            cubit.decreaseWeight();
                          },
                        ),
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      Expanded(
                        child: MyContainerCal(
                          heroName1: 'b3',
                          heroName2: 'b4',
                          text: 'AGE',
                          data: cubit.age.toString(),
                          processOne: () {
                            cubit.increaseAge();
                          },
                          processTwo: () {
                            cubit.decreaseAge();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: const Color(0xFF009999),
                width: double.infinity,
                height: 60,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MyResultPage(
                        gender: isMale,
                        height: height,
                        weight: cubit.weight,
                        age: cubit.age,
                      ),
                    ));
                  },
                  hoverColor: const Color(0xffe62e00),
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backColor,
      ),
      body: myBodyWidget(width),
    );
  }
}