import 'package:flutter/material.dart';
import 'package:skycast_weather_app/views/search_view.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red[400]!,
            Colors.red[500]!,
            Colors.red[200]!,
            Colors.red[100]!,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "There Is No Weather Yet.",
              style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Start Searching Now.",
              style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/search.png",
              width: 350,
              height: 350,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Color.fromARGB(255, 171, 21, 10),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const Searchview();
                    }),
                  );
                },
                child: const Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'KaushanScript'),
                )),
          ],
        ),
      ),
    );
  }
}
