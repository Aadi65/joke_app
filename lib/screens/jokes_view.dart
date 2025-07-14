import 'package:flutter/material.dart';
import 'package:joke_app/providers/joke_provider.dart';
import 'package:provider/provider.dart';

class JokesViewScreen extends StatelessWidget {
  const JokesViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JokeProvider>(builder: (context, jokeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "${jokeProvider.currentCategory} Jokes",
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: jokeProvider.jokes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "${jokeProvider.jokes[index].joke}",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              );
            }),
      );
    });
  }
}
