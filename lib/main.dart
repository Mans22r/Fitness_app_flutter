import 'package:flutter/material.dart';
import 'screens/activity_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/workout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Eurostile'),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            fontFamily: 'Eurostile',
            fontSize: 14,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Eurostile',
            fontSize: 14,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/activity': (context) => const ActivityScreen(),
        '/workout': (context) => const WorkoutScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),  // Custom widget to show the default home screen with a background image
    const ActivityScreen(),
    const WorkoutScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        selectedItemColor: const Color.fromARGB(255, 128, 90, 233),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/background.jpeg'), // Your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Content of the Home Screen
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Fitness World',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Eurostile',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your journey to a healthier life starts here.',
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Eurostile',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
