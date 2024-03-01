import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String quoteText;
  final String authorName;
  const SecondScreen(
      {Key? key, required this.quoteText, required this.authorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              quoteText,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "~ $authorName",
                  style: const TextStyle(
                      fontSize: 15, fontStyle: FontStyle.italic),
                )),
          ),
        ]),
      ),
    );
  }
}
