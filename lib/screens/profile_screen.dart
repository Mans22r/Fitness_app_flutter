// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<bool> isSelected = [true, false, false];
  
  // Define a list of colors for alternating background
  final List<Color> cardColors = [
    const Color.fromARGB(255, 206, 134, 219),
    const Color.fromARGB(255, 128, 90, 233),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 42, 42),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('lib/assets/workout-3.png'),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HI JAMES',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Eurostile',
                              ),
                            ),
                            Text(
                              '⚡ Fitness Freak',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: 'Eurostile',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                        // Handle notification icon press
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 198, 248, 130),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Progress',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontFamily: 'Eurostile',
                                  ),
                                ),
                                Text(
                                  'Lower Body',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Eurostile',
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Cardio   10 mins',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontFamily: 'Eurostile',
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '538 CALORIES',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bourgeois',
                                  ),
                                ),
                              ],
                            ),
                            CircularProgressIndicator(
                              value: 0.72,
                              backgroundColor: Color.fromARGB(255, 255, 255, 255),
                              color: Color.fromARGB(255, 0, 0, 0),
                              strokeWidth: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
  child: ToggleButtons(
    borderRadius: BorderRadius.circular(16),
    borderColor: const Color.fromARGB(255, 169, 169, 169), // Grey border color
    borderWidth: 1, // Thin border
    selectedBorderColor: const Color.fromARGB(255, 0, 0, 0),
    selectedColor: Colors.black,
    fillColor: const Color.fromARGB(255, 255, 255, 255),
    color: Colors.white,
    constraints: const BoxConstraints(minHeight: 36, minWidth: 120),
    onPressed: (int index) {
      setState(() {
        // Update the selected button
        for (int i = 0; i < isSelected.length; i++) {
          isSelected[i] = i == index;
        }
      });
    },
    isSelected: isSelected,
    children: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10), // Small padding for the selected container
        child: Text('All workouts', style: TextStyle(fontFamily: 'Eurostile')),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10), // Small padding for the selected container
        child: Text('Lower body', style: TextStyle(fontFamily: 'Eurostile')),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10), // Small padding for the selected container
        child: Text('Upper body', style: TextStyle(fontFamily: 'Eurostile')),
      ),
    ],
  ),
),

                const SizedBox(height: 20),
                Column(
                  children: [
                    WorkoutCard(
                      title: 'Lower body workout',
                      duration: '30 mins',
                      image: 'lib/assets/workout.jpeg',
                      exercises: 'Glutes/ Squads / Hamstrings',
                      backgroundColor: cardColors[0],
                    ),
                    const SizedBox(height: 20),
                    WorkoutCard(
                      title: 'Upper body workout',
                      duration: '20 mins',
                      image: 'lib/assets/workout.jpeg',
                      exercises: 'Chest / Back / Shoulders',
                      backgroundColor: cardColors[1],
                    ),
                    const SizedBox(height: 20),
                    WorkoutCard(
                      title: 'Upper body workout',
                      duration: '20 mins',
                      image: 'lib/assets/workout.jpeg',
                      exercises: 'Chest / Back / Shoulders',
                      backgroundColor: cardColors[0],
                    ),
                    const SizedBox(height: 20),
                    WorkoutCard(
                      title: 'Upper body workout',
                      duration: '20 mins',
                      image: 'lib/assets/workout.jpeg',
                      exercises: 'Chest / Back / Shoulders',
                      backgroundColor: cardColors[1],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String duration;
  final String image;
  final String exercises;
  final Color backgroundColor;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.image,
    required this.exercises,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Image.asset(image, height: 80, width: 80),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Eurostile',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  'Cardio  •  $exercises',
                  style: const TextStyle(
                    color: Color.fromARGB(179, 0, 0, 0),
                    fontSize: 18,
                    fontFamily: 'Eurostile',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.white70, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Bourgeois',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
