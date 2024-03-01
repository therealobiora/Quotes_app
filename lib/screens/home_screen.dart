import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'second_screen.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () async {
                var url = Uri.parse(
                    'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');
                var response = await http.get(url);
                // print('Response status: ${response.statusCode}');
                // print('Response body: ${response.body}');
                var data = jsonDecode(response.body);
                String quote = data["content"];
                String author = data["author"];
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondScreen(
                          quoteText: quote,
                          authorName: author,
                        )));
              },
              child: const Text(
                'Get Quote!',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
