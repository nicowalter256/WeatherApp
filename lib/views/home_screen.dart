import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_bar.dart';
import 'package:weather_app/widgets/info_card.dart';
import 'package:weather_app/widgets/location.dart';
import '../constants/weather_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherController weatherController = WeatherController();

  @override
  void initState() {
    weatherController.fetchWeatherInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: weatherController,
      child: Consumer<WeatherController>(
        builder: (_, model, child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomAppBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    Location(
                      weather: model.weather,
                    ),
                    Hero(
                        tag: 'TAG',
                        child: Material(
                            color: Colors.transparent,
                            child: InfoCard(
                              weather: model.weather,
                            ))),
                    // ContainerList(),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Spacer(),
                            Text(
                              'Next 14 Days >',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    //HoursList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
