import 'package:bmi_counter_new/bmi_result_list.dart';
import 'package:bmi_counter_new/new_person_info.dart';
import 'package:bmi_counter_new/person_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI COUNTER",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(255, 19, 4, 0),
        ),
      ),
      home: const HomePage(
        bmiResult: "",
        bmiUnderlineText: "",
        heightOfPerson: "",
        weightOfPerson: "",
        nameOfperson: "",
        bmiValue: 0.0,
        resultList: [],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String bmiResult;
  final String bmiUnderlineText;
  final String heightOfPerson;
  final String weightOfPerson;
  final String nameOfperson;
  final double bmiValue;
  final List resultList;
  const HomePage(
      {super.key,
      required this.bmiResult,
      required this.bmiUnderlineText,
      required this.bmiValue,
      required this.heightOfPerson,
      required this.weightOfPerson,
      required this.nameOfperson,
      required this.resultList});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Person> person = [];

  startModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => GestureDetector(
        child: NewPersonInfo(addNewPerson),
      ),
    );
  }

  void addNewPerson(String height, String weight, String name) {
    final newPerson = Person(height, weight, name);
    setState(() {
      person.add(newPerson);
    });
  }

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
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.arrow_forward_ios),
          //   ),
          // ],
          title: const Text(
            "Bmi Counter",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Name: ${widget.nameOfperson}",
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      "Height: ${widget.heightOfPerson}cm",
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      "Weight: ${widget.weightOfPerson}kg",
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bmi Value: ${widget.bmiValue}",
                        style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.0,
                            color: Colors.white),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        widget.bmiResult,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 30.0,
                            color: Colors.red),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        widget.bmiUnderlineText,
                        style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        BmiResultList(resultList: widget.resultList),
                  ),
                );
                print(widget.resultList);
              },
              icon: const Icon(Icons.person),
              label: const Text("Check Out the List"),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "HomePage"),
            NavigationDestination(icon: Icon(Icons.person), label: "HomePage"),
          ],
        ),
        floatingActionButton: Container(
          height: 200,
          width: 200,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () => startModalBottomSheet(context),
              backgroundColor: Colors.black.withOpacity(0.5),
              child: const Text(
                "Enter Data",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
