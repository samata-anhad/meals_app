import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icons, required this.label});

  final IconData icons; //flutter Build in class IconData
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          size: 17, 
          color: Colors.white
          ),
      const SizedBox(width: 6,),
      Text(
        label,
        style: TextStyle(
        color: Colors.white
        ),
       )
      ],
      
    );
  }
}
