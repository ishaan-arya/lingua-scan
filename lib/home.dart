import 'package:flutter/material.dart';
import 'learn.dart';
import 'test.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Learn(),
                  ),
                );
              },
              child: Text('Learn'),
            ),
            SizedBox(height: 20), // Add some spacing between the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Test(),
                  ),
                );
              },
              child: Text('Test Your Skills'),
            ),
          ],
        ),
      ),
    );
  }
}
