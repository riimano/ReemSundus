import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';

class MyHomePage extends StatelessWidget {
  final User user;

  const MyHomePage({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 210, 237),
        title: Text(
          'Welcome, ${user.username}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ), // Display username in the app bar
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
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push('/Tips');
                  },
                  child: _buildCard(
                      cardTitle: 'Tips',
                      imageAsset:
                          'assets/images/undraw_Share_opinion_re_4qk7 (1).png'),
                ),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/Yoga');
                    },
                    child: _buildCard(
                        cardTitle: 'Yoga',
                        imageAsset: 'assets/images/undraw_Yoga_re_i5ld.png')),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/Music');
                    },
                    child: _buildCard(
                        cardTitle: 'Music',
                        imageAsset:
                            'assets/images/undraw_Compose_music_re_wpiw.png')),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/Meditation');
                    },
                    child: _buildCard(
                        cardTitle: 'Meditation',
                        imageAsset:
                            'assets/images/undraw_Meditation_re_gll0.png')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).push('/MyProfile', extra: user),
        child: Icon(Icons.person),
      ),
    );
  }

  // Function to create a Card widget
  Widget _buildCard({required String cardTitle, required String imageAsset}) {
    return Card(
      color: const Color.fromARGB(255, 157, 210, 237),
      elevation: 2.0,
      child: Column(
        children: [
          // Use an Image widget to display the image
          Image.asset(
            imageAsset,
            height: 120, // Adjust the height as needed
            width: double.infinity, // Take the full width of the card
            fit: BoxFit.fill, // Adjust the BoxFit as needed
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                cardTitle,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
