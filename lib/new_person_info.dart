import 'dart:math';
import 'package:bmi_counter_new/main.dart';
import 'package:flutter/material.dart';

class NewPersonInfo extends StatefulWidget {
  final Function addNewPerson;
  NewPersonInfo(this.addNewPerson);

  @override
  State<NewPersonInfo> createState() => _NewPersonInfoState();
}

class _NewPersonInfoState extends State<NewPersonInfo> {
  String bmiResultText = "";
  String bmiUnderlineText = "";
  String heightOfPerson = "";
  String weightOfPerson = "";
  String nameOfPersonText = "";
  double bmiValue = 0;
  final List resultList = [];

  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  //* Saves data from userinput of textfields
  void sendBackNewPersonInfo() {
    final nameOfPerson = nameController.text;
    final personHeight = heightController.text;
    final personWeight = weightController.text;
    nameOfPersonText = nameOfPerson;
    heightOfPerson = personHeight;
    weightOfPerson = personWeight;
    int.parse(heightOfPerson);
    int.parse(personWeight);

    widget.addNewPerson(
      nameOfPerson,
      personHeight,
      personWeight,
    );
    resultList.add(nameOfPersonText);
    resultList.add(heightOfPerson);
    resultList.add(weightOfPerson);
  }

  //* Calculating bmi of person
  void bmiResult() {
    final bmi = int.parse(weightController.text) /
        pow(int.parse(heightController.text) / 100, 2);

    setState(
      () {
        if (bmi < 18.5) {
          bmiResultText = "Underweight";
          bmiUnderlineText = "You should eat more";
          bmiValue = bmi;
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          bmiResultText = "Normal";
          bmiUnderlineText = "You are stable";
          bmiValue = bmi;
        } else if (bmi >= 25 && bmi <= 29.9) {
          bmiResultText = "Overweight";
          bmiUnderlineText = "You should eat less";
          bmiValue = bmi;
        } else if (bmi >= 30 && bmi <= 34.9) {
          bmiResultText = "Obease";
          bmiUnderlineText = "Call the doctor";
          bmiValue = bmi;
        } else {
          bmiResultText = "Extreme Obease";
          bmiUnderlineText = "Pray to god";
          bmiValue = bmi;
        }
        resultList.add(bmiResultText);
        resultList.add(bmiUnderlineText);
        resultList.add(bmiValue);
      },
    );
    //* Sends back data to HomePage for rendering
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => HomePage(
          bmiResult: bmiResultText,
          bmiUnderlineText: bmiUnderlineText,
          bmiValue: bmiValue,
          heightOfPerson: heightOfPerson,
          weightOfPerson: weightOfPerson,
          nameOfperson: nameOfPersonText,
          resultList: [resultList],
        ),
      ),
    );
    print(resultList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(labelText: "Enter Name"),
          controller: nameController,
          style: const TextStyle(fontSize: 20.0),
        ),
        TextField(
          decoration: const InputDecoration(labelText: "Enter Height"),
          controller: heightController,
          style: const TextStyle(fontSize: 20.0),
        ),
        TextField(
          decoration: const InputDecoration(labelText: "Enter Weight"),
          controller: weightController,
          style: const TextStyle(fontSize: 20.0),
        ),
        const Padding(
          padding: EdgeInsets.all(50.0),
        ),
        ElevatedButton.icon(
          onPressed: () {
            sendBackNewPersonInfo();
            bmiResult();
          },
          icon: const Icon(Icons.person),
          label: const Text("Se Your Results"),
          style: ElevatedButton.styleFrom(
            primary: Colors.black.withOpacity(0.4),
            textStyle: const TextStyle(fontSize: 20.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    );
  }
}
