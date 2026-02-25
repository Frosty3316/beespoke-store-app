import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('history');
    final List urls = box.get('urls', defaultValue: []);

    return Scaffold(
  appBar: AppBar(
    title: const Text('Browsing History'),
    actions: [
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          box.delete('urls');
          Navigator.pop(context);
        },
      )
    ],
  ),
  body: urls.isEmpty
      ? const Center(child: Text('No history yet'))
      : ListView.builder(
          itemCount: urls.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(urls[index]),
            );
          },
        ),
    );
  }
}