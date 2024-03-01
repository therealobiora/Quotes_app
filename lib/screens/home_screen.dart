import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";

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
              quote,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, bottom: 40.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "~ $author",
                  style: const TextStyle(
                      fontSize: 15, fontStyle: FontStyle.italic),
                )),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              onPressed: () async {
                var url = Uri.parse(
                    'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');
                var response = await http.get(url);
                // print('Response status: ${response.statusCode}');
                // print('Response body: ${response.body}');
                var data = jsonDecode(response.body);

                quote = data["content"];
                author = data["author"];

                setState(() {
                  quote = quote;
                  author = author;
                });
              },
              child: const Text(
                'Get Quote!',
              )),
        ]),
      ),
    );
  }
}
