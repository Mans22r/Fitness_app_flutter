// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int selectedDayIndex = 2;
  int selectedDateIndex = 2; 
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 42, 42),
      appBar: AppBar(
        title: const Text(
          'Your Activity',
          style: TextStyle(color: Colors.white, fontFamily: 'Eurostile', fontSize: 45),
        ),
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'May 2024',
                  style: TextStyle(color: Colors.white, fontFamily: 'Bourgeois', fontSize: 20),
                ),
                Row(
                  children: [
                    // Backward Navigation Icon
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                        onPressed: () {
                          // Backward navigation action
                        },
                      ),
                    ),
                    const SizedBox(width: 2),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                        onPressed: () {
                          // Forward navigation action
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Day Names Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                List<String> days = ["M", "T", "W", "T", "F", "S", "S"];
                bool isSelected = index == selectedDayIndex;
                return Text(
                  days[index],
                  style: TextStyle(
                    color: isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.white,
                    fontFamily: 'Eurostile',
                    fontSize: 18,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              }),
            ),
            const SizedBox(height: 6),
            // Date Numbers Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                List<String> days = ["16", "17", "18", "19", "20", "21", "22"];
                bool isSelected = index == selectedDayIndex;
                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color.fromARGB(255, 198, 248, 130) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    days[index],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontFamily: 'Bourgeois',
                      fontSize: 18,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 26),
            Card(
              color: const Color.fromARGB(255, 198, 248, 130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's Challenge",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Eurostile',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Do your plan before 9:00 AM",
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Eurostile'),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'lib/assets/workout-1-bg.png', 
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(16),
                borderColor: const Color.fromARGB(255, 169, 169, 169), // Grey border color
                borderWidth: 1, // Thin border
                selectedBorderColor: const Color.fromARGB(255, 0, 0, 0),
                selectedColor: Colors.black,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                color: Colors.white,
                constraints: const BoxConstraints(minHeight: 36, minWidth: 100),
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    // Update the isSelected list based on the index
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10), // Small padding for the selected container
                    child: Text('All', style: TextStyle(fontFamily: 'Eurostile')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10), // Small padding for the selected container
                    child: Text('Running', style: TextStyle(fontFamily: 'Eurostile')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10), // Small padding for the selected container
                    child: Text('Cycling', style: TextStyle(fontFamily: 'Eurostile')),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: const Color.fromARGB(255, 206, 134, 219),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.directions_walk, color: Color.fromARGB(255, 0, 0, 0), size: 30),
                          SizedBox(height: 8),
                          Text(
                            'Steps',
                            style: TextStyle(color: Color.fromARGB(179, 0, 0, 0), fontSize: 16, fontFamily: 'Eurostile'),
                          ),
                          Text(
                            '1840 Steps',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Bourgeois',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: const Color.fromARGB(255, 128, 90, 233),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.flag, color: Color.fromRGBO(0, 0, 0, 1), size: 30),
                          SizedBox(height: 8),
                          Text(
                            'My Goals',
                            style: TextStyle(color: Color.fromARGB(179, 0, 0, 0), fontSize: 16, fontFamily: 'Eurostile'),
                          ),
                          Text(
                            '42%',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Bourgeois',
                            ),
                          ),
                          SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: 0.42,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              color: const Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.fiber_manual_record, size: 12, color: Colors.yellow),
                            title: Text(
                              '1200 Kcal Burned',
                              style: TextStyle(color: Colors.white, fontFamily: 'Bourgeois'),
                            ),
                            subtitle: Text(
                              'Target',
                              style: TextStyle(color: Colors.white70, fontFamily: 'Eurostile'),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            leading: Icon(Icons.fiber_manual_record, size: 12, color: Colors.yellow),
                            title: Text(
                              '328 Kcal Burned',
                              style: TextStyle(color: Colors.white, fontFamily: 'Bourgeois'),
                            ),
                            subtitle: Text(
                              '872 Kcal Remaining',
                              style: TextStyle(color: Colors.white70, fontFamily: 'Eurostile'),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.fiber_manual_record, size: 12, color: Colors.yellow),
                            title: Text(
                              '3000 Steps',
                              style: TextStyle(color: Colors.white, fontFamily: 'Bourgeois'),
                            ),
                            subtitle: Text(
                              'Goal: 5000 Steps',
                              style: TextStyle(color: Colors.white70, fontFamily: 'Eurostile'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 161, 44, 44),
                      ),
                      child: const Center(
                        child: Text(
                          'Chart',
                          style: TextStyle(color: Colors.white, fontFamily: 'Eurostile'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
