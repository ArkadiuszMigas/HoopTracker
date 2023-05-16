import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShootingPage extends StatefulWidget {
  const ShootingPage({super.key});

  @override
  State<ShootingPage> createState() => _ShootingPageState();
}

class _ShootingPageState extends State<ShootingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shooting'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Training')
            .doc('Shooting')
            .collection('exercises')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return (const Center(
              child: Text('No Exercises Added yet :)'),
            ));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                String url = snapshot.data!.docs[index]['url'];
                return Column(
                  children: [
                    Image.network(
                      url,
                      height: 280,
                      width: 350,
                      scale: 0.2,
                      fit: BoxFit.cover,
                    ),
                    Text('${snapshot.data!.docs[index]['Reps']}')
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
