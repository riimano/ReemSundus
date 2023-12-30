import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';

class UserPage extends StatefulWidget {
  final User user;

  const UserPage({super.key, required this.user});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(widget.user.username),
            ),

            SizedBox(height: 20),

            // Username
            Text(
              'Username: ${widget.user.username}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
