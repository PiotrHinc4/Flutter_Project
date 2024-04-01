import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  double _costForPerson = 100.0; // Przykładowa wartość, możesz dostosować
  double _bill = 0.0; // Zmienna do przechowywania wprowadzonej kwoty
  int _numberOfPeople = 3; // Przykładowa wartość liczby osób
  double _tip = 0.0; // Przykładowa wartość napiwku
  double _tipPercent = 5; // Ile procent wynosi napiwek

  TextEditingController _billController = TextEditingController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreenAccent, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightGreenAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Tyle płaci każda osoba:',
                    style: TextStyle(fontSize: 24, color: Colors.green),
                  ),
                  Text(
                    "${_costForPerson}zł",
                    style: const TextStyle(fontSize: 40,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),

                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: 400,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.attach_money,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        'Do zapłaty:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          controller: _billController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              _bill = double.parse(value);
                            } else {
                              _bill = 0.0;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Wprowadź kwotę',
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightGreenAccent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Liczba osób:',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              if (_numberOfPeople > 1) {
                                _numberOfPeople--;
                              }
                            },
                            icon: const Icon(Icons.remove),
                            color: Colors.green,

                          ),
                          Text(
                            _numberOfPeople.toString(),
                            style: const TextStyle(fontSize: 20, color: Colors.green),
                          ),
                          IconButton(
                            onPressed: () {
                              _numberOfPeople++;
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Cały napiwek:',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        "${_tip}zł",
                        style: const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$_tipPercent%",
                        style: const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Slider(
                        value: _tipPercent,
                        onChanged: (value) {
                          _tipPercent = value;
                        },
                        min: 0,
                        max: 20,
                        divisions: 10,
                        activeColor: Colors.green,
                        label: _tipPercent.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
