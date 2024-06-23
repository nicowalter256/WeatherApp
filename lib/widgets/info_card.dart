import 'package:flutter/material.dart';
import 'package:weather_app/constants/images.dart';
import 'package:weather_app/model/weather.dart';

class InfoCard extends StatelessWidget {
  final Weather? weather;
  const InfoCard({super.key, this.weather});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 240,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.only(bottom: 30),
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.withOpacity(.7),
                      Colors.blue,
                      Colors.blue,
                    ])),
          ),
          // Positioned(
          //     top: -10,
          //     left: 10,
          //     child: Image.asset(
          //       umbrella,
          //       // controller.getImage(controller.currentIndex.value),
          //       height: 150,
          //       width: 170,
          //       fit: BoxFit.fill,
          //     )),
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${weather?.weather[0].main}",
                  style: const TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${weather?.visibility}",
                  style: TextStyle(
                      height: 0,
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white.withOpacity(.1)],
                      // Adjust the stops to control the gradient area
                    ).createShader(bounds);
                  },
                  child: Text(
                    "${weather?.main.temp}",
                    style: const TextStyle(
                      fontSize: 60,
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Initial color of the text
                    ),
                  ),
                ),
                Text(
                  "${weather?.main.humidity}",
                  style: const TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.white.withOpacity(.1)],
                  // Adjust the stops to control the gradient area
                ).createShader(bounds);
              },
              child: Image.asset(
                windWave,
                height: 100,
                width: 200,
              ),
            ),
          )
        ],
      ),
    );
  }
}
