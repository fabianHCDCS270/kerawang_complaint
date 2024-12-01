import 'package:flutter/material.dart';
import '../models/form_entry.dart';

class NewFormPage extends StatefulWidget {
  final FormEntry? entry;

  NewFormPage({this.entry});

  @override
  _NewFormPageState createState() => _NewFormPageState();
}

class _NewFormPageState extends State<NewFormPage> {
  final _titleController = TextEditingController();
  String? _selectedCategory;
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.entry != null) {
      _titleController.text = widget.entry!.title;
      _selectedCategory = widget.entry!.category;
      _descriptionController.text = widget.entry!.description;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final newEntry = FormEntry(
      title: _titleController.text,
      category: _selectedCategory ?? '',
      description: _descriptionController.text,
    );

    Navigator.of(context).pop(newEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry == null ? 'New Item' : 'Update Item'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Media Section
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Add functionality to select media
                  },
                  icon: Icon(Icons.add, size: 30, color: Colors.orange),
                ),
                SizedBox(width: 8),
                Text(
                  'Add Media',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Title Field
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Category Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              value: _selectedCategory,
              items: ['1', '2', '3']
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text('Category $category'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Description Field
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Submit/Update Button
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.entry == null ? 'Submit' : 'Update'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
