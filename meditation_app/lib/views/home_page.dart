import 'package:flutter/material.dart';

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
                _buildCard('Card 1'),
                _buildCard('Card 2'),
                _buildCard('Card 3'),
                _buildCard('Card 4'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the button press to show user profile
          // Add your logic here
        },
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
