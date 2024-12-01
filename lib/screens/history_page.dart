import 'package:flutter/material.dart';
import '../models/form_entry.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<FormEntry> _historyEntries = []; // List of history items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Purchases - History'),
        backgroundColor: Colors.orange,
      ),
      body: _historyEntries.isEmpty
          ? Center(
              child: Text(
                'No history yet!',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _historyEntries.length,
              itemBuilder: (context, index) {
                final entry = _historyEntries[index];
                return ListTile(
                  title: Text(entry.title),
                  subtitle: Text(entry.category),
                  onTap: () {
                    // Viewing history entries could be read-only
                  },
                );
              },
            ),
    );
  }
}
