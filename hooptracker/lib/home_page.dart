import 'package:flutter/material.dart';
import 'package:hooptracker/games_page.dart';
import 'package:hooptracker/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Hoop Tracker'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: size.width,
              height: size.height * 0.35,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const NewsPage();
                        },
                      ),
                    );
                  },
                  child: const Text('News')),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: size.width,
              height: size.height * 0.35,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const GamesPage();
                      },
                    ),
                  );
                },
                child: const Text('Games'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
