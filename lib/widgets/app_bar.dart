import 'package:flutter/material.dart';
import 'package:weather_app/constants/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.notifications_none,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            nightRain,
            height: 30,
            width: 30,
          ),
        )
      ],
    );
  }
}
