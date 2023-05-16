import 'package:flutter/material.dart';
import 'package:hooptracker/dribble_page.dart';
import 'package:hooptracker/jump_page.dart';
import 'package:hooptracker/shoot_page.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
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
              margin: const EdgeInsets.all(2),
              width: size.width,
              height: size.height * 0.24,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const DribblePage();
                        },
                      ),
                    );
                  },
                  child: const Text('Dribble')),
            ),
            Container(
              margin: const EdgeInsets.all(2),
              width: size.width,
              height: size.height * 0.24,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ShootingPage();
                      },
                    ),
                  );
                },
                child: const Text('Shooting'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2),
              width: size.width,
              height: size.height * 0.24,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const JumpPage();
                      },
                    ),
                  );
                },
                child: const Text('Jump'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
