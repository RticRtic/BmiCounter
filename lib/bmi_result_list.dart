import 'package:bmi_counter_new/main.dart';
import 'package:bmi_counter_new/person_model.dart';
import 'package:flutter/material.dart';

import 'list_model.dart';

int itemCount = 10;

//* List of BMI results.

class BmiResultList extends StatelessWidget {
  const BmiResultList({super.key, required resultList, required nameOfPerson});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RESULT",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(255, 19, 4, 0),
        ),
      ),
      home: const PersonResultList(
        resultList: [],
        nameOfPerson: "",
      ),
    );
  }
}

class PersonResultList extends StatefulWidget {
  final List resultList;
  final String nameOfPerson;
  const PersonResultList(
      {super.key, required this.resultList, required this.nameOfPerson});

  @override
  State<PersonResultList> createState() => _PersonResultListState();
}

class _PersonResultListState extends State<PersonResultList> {
  List<ListModel> list = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 19, 46, 43),
            Color.fromRGBO(155, 245, 230, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(
                    bmiResult: "",
                    bmiUnderlineText: "",
                    bmiValue: 0,
                    heightOfPerson: "",
                    weightOfPerson: "",
                    nameOfperson: "",
                    resultList: [],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              horizontalTitleGap: 110.0,
              title: Text("BMI"),
              leading: Text("NAME"),
              trailing: Text("STATUS"),
            );
          },
        ),
      ),
    );
  }
}
