import 'package:flutter/material.dart';
import 'package:imc/result_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double cm;
  late double kg;
  late double total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('I.M.C', style: TextStyle(fontSize: 40, color: Colors.black)), centerTitle: true, backgroundColor: Colors.transparent),
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: SizedBox(
              height: 250,
              width: 250,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(progressBarColors: [Colors.black, Colors.red], trackColor: Colors.black),
                ),
                initialValue: 0,
                min: 0,
                max: 200,
                onChange: (value) {
                  setState(() {
                    cm = value;
                    cm = cm / 100;
                  });
                },
                innerWidget: (percentage) {
                  return Center(
                    child: Text(
                      '${percentage.toInt()} Cm',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w200, color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: SizedBox(
              height: 250,
              width: 250,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(progressBarColors: [Colors.black, Colors.red], trackColor: Colors.black),
                ),
                initialValue: 0,
                min: 0,
                max: 200,
                onChange: (value) {
                  setState(() {
                    kg = value;
                  });
                },
                innerWidget: (kg) {
                  return Center(
                    child: Text(
                      '${kg.toInt()} Kg',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w200, color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(height: 50),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  total = kg / (cm * cm);
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(total)));
                });
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black), elevation: MaterialStateProperty.all(20)),
              child: const Text('Calcular', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
