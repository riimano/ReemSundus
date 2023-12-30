import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/med_provider.dart';
import 'package:meditation_app/widgets/user_profile.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, Username'), // Display username in the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
            SizedBox(height: 16.0), // Add some spacing

            // Grid of Cards
            GridView.count(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              children: [
                InkWell(onTap: () {
                  child:
                  _buildCard('Tips ');
                }),
                _buildCard('Yoga videos'),
                _buildCard('Music'),
                _buildCard('Meditation'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).push('/user'),
        child: Icon(Icons.person),
      ),
    );
  }

  // Function to create a Card widget
  Widget _buildCard(String cardTitle) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            cardTitle,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
