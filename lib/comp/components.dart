import 'package:flutter/material.dart';
import '../constants/color_pick.dart';

class MyContainerImage extends StatelessWidget {
  
  final String text;
  final IconData icon;
  void Function()? process;
  Color backColor;
  Color textcolor;

  MyContainerImage({
    super.key,
    required this.text,
    required this.icon,
    required this.process,
    this.backColor = containerColor,
    this.textcolor = textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backColor,
      ),
      child: InkWell(
        onTap: process,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: Colors.white,
            ),
            Text(
              text, 
              style: TextStyle(
                fontSize: 20, 
                color: textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyContainerCal extends StatelessWidget {
  
  final String text;
  final String data;
  void Function()? processOne;
  void Function()? processTwo;
  final String heroName1;
  final String heroName2;

  MyContainerCal({
    super.key,
    required this.text,
    required this.data,
    required this.processOne,
    required this.processTwo,
    required this.heroName1,
    required this.heroName2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF33334d),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20, 
              color: Color(0xFFa3a3c2),
            ),
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: heroName1,
                onPressed: processOne,
                hoverColor: selectedColor,
                backgroundColor: const Color(0xFF9494b8),
                child: const Icon(Icons.add, color: Colors.white,),
              ),
              const SizedBox(width: 5.0,),
              FloatingActionButton(
                heroTag: heroName2,
                onPressed: processTwo,
                hoverColor: selectedColor,
                backgroundColor: const Color(0xFF9494b8),
                child: const Center(
                  child: Icon(Icons.minimize_outlined, color: Colors.white,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}