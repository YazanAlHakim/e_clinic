import 'package:flutter/material.dart';

class ItemInBar extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String value;
  const ItemInBar({
    Key? key,
    required this.icon,
    required this.color,
    required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          color: color,
          size: 23.0,
        ),
        Text(
          value,
          style: TextStyle(
              color: color,
              fontSize: 11.0,
              fontWeight: FontWeight.w500
          ),
        ),

      ],
    );
  }
}
