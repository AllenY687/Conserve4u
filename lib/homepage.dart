import 'package:flutter/material.dart';
import 'hvac.dart';
import 'water.dart';
import 'light.dart';
import 'comm.dart';

class Homepage extends StatelessWidget {
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
        color: Colors.grey[300],
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            buildInfoCard(Icons.wb_sunny, 'Good Morning! Open your blinds & windows.'),
            buildInfoCard(Icons.thumb_up, 'Great time to do high-energy consumption activities. The prices are low!'),
            buildInfoCard(Icons.thermostat, 'Set your thermostat to 25°C'),
            buildInfoCard(Icons.sentiment_satisfied, 'Your Energy Consumption was 20% less than your neighbors.'),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 0,
        onTap: (index) {
          // Add navigation functionality here based on the tapped index
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HvacPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WaterPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LightPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommPage()),
              );
              break;
            default:
            // Do nothing for the 'Home' icon (index 0)
              break;
          }
        },
      ),
    );
  }

  Widget buildInfoCard(IconData icon, String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.modulate,
            ),
            child: Icon(icon,color: Colors.purple),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
