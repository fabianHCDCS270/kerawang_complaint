import 'package:flutter/material.dart';
import '../models/form_entry.dart';
import '../widgets/new_form_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<FormEntry> _formEntries = []; // List of form entries

  // Handles opening the form to view/update
  void _viewOrUpdateForm(FormEntry entry) async {
    final updatedEntry = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NewFormPage(entry: entry), // Pass entry for update
      ),
    );

    if (updatedEntry != null && updatedEntry is FormEntry) {
      setState(() {
        final index = _formEntries.indexOf(entry);
        _formEntries[index] = updatedEntry; // Update entry in the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Purchases - List'),
        backgroundColor: Colors.orange,
      ),
      body: _formEntries.isEmpty
          ? Center(
              child: Text(
                'No purchases yet!',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _formEntries.length,
              itemBuilder: (context, index) {
                final entry = _formEntries[index];
                return ListTile(
                  title: Text(entry.title),
                  subtitle: Text(entry.category),
                  onTap: () =>
                      _viewOrUpdateForm(entry), // Opens for viewing/updating
                );
              },
            ),
    );
  }
}
