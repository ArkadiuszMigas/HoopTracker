import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Games'),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () => pickDate(context),
                  child: Text('${date.day}/${date.month}/${date.year}'),
                ),
              )
            ]),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Games')
              .where('DATE', isEqualTo: setDate(date))
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return (const Center(
                child: Text('No Games'),
              ));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String url1 = snapshot.data!.docs[index]['url1'];
                    String url2 = snapshot.data!.docs[index]['url2'];
                    String score = snapshot.data!.docs[index]['SCORE'];
                    return Row(
                      children: [
                        Image.network(
                          url1,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(score),
                        ),
                        Image.network(
                          url2,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    );
                  });
            }
          },
        ));
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 2),
        lastDate: DateTime(DateTime.now().year + 2));

    if (newDate == null) return;

    setState(() => date = newDate);
    setDate(date);
  }

  String setDate(DateTime date) {
    String formattedDate = '${date.day}/${date.month}/${date.year}';
    return formattedDate;
  }
  
}
