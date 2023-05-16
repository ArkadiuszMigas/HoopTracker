import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DribblePage extends StatefulWidget {
  const DribblePage({super.key});

  @override
  State<DribblePage> createState() => _DribblePageState();
}

class _DribblePageState extends State<DribblePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dribble'),
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
            .doc('Dribble')
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
