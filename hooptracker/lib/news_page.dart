import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
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
            .collection('News')
            .doc('Awards')
            .collection('images')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return (const Center(
              child: Text('No News'),
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
                      height: 500,
                      fit: BoxFit.cover,
                    ),
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
