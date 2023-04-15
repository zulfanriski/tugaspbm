import 'package:flutter/material.dart';
import 'register_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME MASTER $username",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(height: 24,),
              Text('BMI LU NIH!: ${_result.toStringAsFixed(1)}', 
                style: TextStyle(
                    fontSize: 18
                  ),
              ),
              SizedBox(height: 24,),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'MASUKIN TINGGI ANTUM cm'),
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'MASUKIN BERAT ANTUM kg'),
              ),
              SizedBox(height: 24,),
              ElevatedButton(
                onPressed: () {
                  double height = double.parse(heightController.text) / 100;
                  double weight = double.parse(weightController.text);
                  setState(() {
                    _result = weight / (height * height);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Menghitung BMI...")));
                },
                child: Text('Hitung BMI',
                  style: TextStyle(
                      fontSize: 18
                    ),
                ),
              ),
              SizedBox(height: 150,)
            ],
          ),
        ),
      ),
    );
  }
}
