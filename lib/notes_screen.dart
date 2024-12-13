import 'package:flutter/material.dart';

class Note {
  Note(this.title, this.describtion);
  final String title;
  final String describtion;
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key, required this.noteList});

  final List<Note> noteList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note screen')),
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) => ListTile(
          splashColor: Colors.red,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(note: noteList[index]),
              )),
          title: Text(noteList[index].title),
          subtitle: Text(noteList[index].describtion),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(note.title),
          const SizedBox(
            height: 20,
          ),
          Text(note.describtion)
        ],
      ),
    );
  }
}

class GirdScreen extends StatelessWidget {
  const GirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
            50,
            (i) => ListTile(
                title: Center(
                    child: Text(
              'title $i ...',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ))),
          )),
    );
  }
}
