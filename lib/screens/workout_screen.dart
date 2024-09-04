import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkoutScreen(),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/workout-2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Top Layer content
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Workout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Eurostile',
                        ),
                      ),
                      Column(
                        children: [
                          CircularButton(),
                          SizedBox(height: 16),
                          Column(
                            children: [
                              Text(
                                '328',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Bourgeois',
                                ),
                              ),
                              Text(
                                'Kcal Burned',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Eurostile',
                                ),
                              ),
                              CalorieIndicator(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Bottom Section with Timer, Elapsed Time, and Sets
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 250, 250, 250),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Elapsed',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Eurostile',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '04:30',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Bourgeois',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '01:30',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bourgeois',
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Set',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Eurostile',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '2/5',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
          ),
        ],
      ),
    );
  }
}

// Circular Button for Play/Pause
class CircularButton extends StatefulWidget {
  const CircularButton({super.key});

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.black,
          size: 32,
        ),
      ),
    );
  }
}

class CalorieIndicator extends StatelessWidget {
  const CalorieIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Increase the width to fit multiple slabs
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white, // White background for the cylindrical shape
        borderRadius: BorderRadius.circular(40), // Make it more cylindrical
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSlab(Colors.purple[800]!),
          _buildSlab(Colors.purple[600]!),
          _buildSlab(Colors.purple[400]!),
          _buildSlab(Colors.purple[200]!),
          _buildSlab(Colors.purple[100]!),
        ],
      ),
    );
  }

  Widget _buildSlab(Color color) {
    return Container(
      width: 40,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
