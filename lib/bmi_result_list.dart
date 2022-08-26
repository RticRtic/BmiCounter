import 'package:bmi_counter_new/person_model.dart';
import 'package:flutter/material.dart';

int itemCount = 10;

//* List of BMI results.

class BmiResultList extends StatelessWidget {
  const BmiResultList({super.key, required resultList});

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
      ),
    );
  }
}

class PersonResultList extends StatefulWidget {
  final List resultList;
  const PersonResultList({super.key, required this.resultList});

  @override
  State<PersonResultList> createState() => _PersonResultListState();
}

class _PersonResultListState extends State<PersonResultList> {
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
          title: const Text(
            "RESULT",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Container(
          child: ElevatedButton(
              onPressed: () {
                print(widget.resultList);
              },
              child: null),
        ),
        // body: ListView.builder(
        //   itemCount: itemCount,
        //   itemBuilder: (BuildContext context, index) {
        //     return ListTile(
        //       title: Text(
        //         widget.resultList.length.toString(),
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
