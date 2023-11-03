import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final String jsonStr = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';
  List<Map<String, dynamic>> cities = [];
  @override
  void initState() {
    super.initState();
    cities = List<Map<String, dynamic>>.from(json.decode(jsonString));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info App'),
        ),
        body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            var city = cities[index];
            return Card(
              child: ListTile(
                title: Text(city['city']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Temperature: ${city['temperature']}°C'),
                    Text('Condition: ${city['condition']}'),
                    Text('Humidity: ${city['humidity']}%'),
                    Text('Wind Speed: ${city['windSpeed']} km/h'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
