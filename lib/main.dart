import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoodSelectionScreen(),
    );
  }
}

class MoodSelectionScreen extends StatefulWidget {
  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  String _mood = "Select Mood";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Tracker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _mood,
              items: <String>['Select Mood', 'Happy', 'Sad', 'Energetic', 'Stressed']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _mood = newValue!;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Task Recommendations
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskRecommendationScreen(mood: _mood)),
                );
              },
              child: Text("See Task Suggestions"),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskRecommendationScreen extends StatelessWidget {
  final String mood;
  TaskRecommendationScreen({required this.mood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Suggestions for $mood"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Suggested Tasks for Your Mood: $mood',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            _getTaskSuggestions(mood),
          ],
        ),
      ),
    );
  }

  Widget _getTaskSuggestions(String mood) {
    switch (mood) {
      case 'Happy':
        return Column(
          children: [
            Text("1. Dance for 10 minutes"),
            Text("2. Watch a funny movie"),
            Text("3. Call a friend"),
          ],
        );
      case 'Sad':
        return Column(
          children: [
            Text("1. Listen to your favorite music"),
            Text("2. Go for a walk"),
            Text("3. Meditate for 10 minutes"),
          ],
        );
      case 'Energetic':
        return Column(
          children: [
            Text("1. Do a workout"),
            Text("2. Take a cold shower"),
            Text("3. Go for a run"),
          ],
        );
      case 'Stressed':
        return Column(
          children: [
            Text("1. Do deep breathing exercises"),
            Text("2. Read a book"),
            Text("3. Take a break and relax"),
          ],
        );
      default:
        return Text("Please select a mood to see tasks.");
    }
  }
}
