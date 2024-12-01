import 'package:flutter/material.dart';
import '../widgets/purchase_option.dart';
import '../widgets/changelog_item.dart';
import '../screens/list_page.dart';
import '../screens/history_page.dart';
import '../widgets/new_form_page.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me Page'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            Container(
              color: Colors.orangeAccent,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'View and edit profile',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // My Purchases Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'My Purchases',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => NewFormPage(), // Opens add form
                      ),
                    );
                  },
                  child: PurchaseOption(icon: Icons.add, label: 'New'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ListPage(), // Opens ongoing list
                      ),
                    );
                  },
                  child: PurchaseOption(icon: Icons.list, label: 'List'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => HistoryPage(), // Opens history list
                      ),
                    );
                  },
                  child: PurchaseOption(icon: Icons.history, label: 'History'),
                ),
              ],
            ),

            Divider(),

            // My Wallet (Changelog Style)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Latest Changes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ChangeLogItem(
              title: 'Version 1.0.1',
              description:
                  'Added support for new features and improved performance.',
            ),
            ChangeLogItem(
              title: 'Version 1.0.0',
              description: 'Initial release of the app with core features.',
            ),
          ],
        ),
      ),
    );
  }
}
