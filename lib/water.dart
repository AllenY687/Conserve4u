import 'package:flutter/material.dart';
import 'homepage.dart';
import 'hvac.dart';
import 'light.dart';
import 'comm.dart';
import 'widgets.dart';

class WaterPage extends StatelessWidget {
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.grey, // Set the desired grey color
                        BlendMode.modulate, // Use blend mode to apply the color
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'CONSERVE4U',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Add settings functionality here
                  },
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[300], // Background color
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildBanner(), // Add the banner here
            buildInfoCard(Icons.waves, 'Your water bill last month was...', '\$50'),
            buildInfoCard(Icons.invert_colors, 'Your water bill projected for this month is...', '\$60'),
            buildInfoCard(Icons.calendar_today, 'The next water bill is due in...', '15 days'),
            Expanded(
              child: SingleChildScrollView(
                child: buildGraph(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget buildBanner() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.purple,
      child: const Text(
        'Water Usage',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildGraph() {
    List<double> waterData = [150, 180, 120, 200, 170, 190, 160, 220, 210, 250, 230, 180];

    return Container(
      height: 200, // Set a fixed height for the graph container
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            waterData.length,
                (index) => Container(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: waterData[index] * 0.5,
                    width: 20,
                    color: Colors.blue, // Bar color
                  ),
                  SizedBox(height: 4),
                  Text(
                    months[index], // Display the month name
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.purple,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: 'HVAC',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.water),
          label: 'Water',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb),
          label: 'Light',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: 'Comm',
        ),
      ],
      currentIndex: 2,
      onTap: (index) {
        if (index == 2) return; // Prevent navigation to the current page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            switch (index) {
              case 0:
                return Homepage();
              case 1:
                return HvacPage();
              case 2:
                return WaterPage();
              case 3:
                return LightPage();
              case 4:
                return CommPage();
              default:
                return Homepage();
            }
          }),
        );
      },
    );
  }
}
