import 'package:flutter/material.dart';
import 'package:weather_app/constants/images.dart';
import 'package:weather_app/model/weather.dart';

class Location extends StatelessWidget {
  final Weather? weather;
  const Location({super.key, this.weather});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${weather?.name}",
              style: const TextStyle(
                  height: 0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              '${weather?.timezone}',
              // Utils.formateDate(DateTime.now()),
              style: TextStyle(
                  color: Colors.grey.withOpacity(.7),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  map,
                  fit: BoxFit.cover,
                )),
          ),
        )
      ],
    );
  }
}
