import 'package:flutter/material.dart';
import 'homepage.dart';
import 'hvac.dart';
import 'water.dart';
import 'light.dart';

class CommPage extends StatelessWidget {
  final List<String> names = ['Mary Smith', 'John Doe', 'Emma Johnson'];
  final List<String> blurbs = [
    'Reduced HVAC usage by setting a programmable thermostat.',
    'Saved water by fixing leaky faucets.',
    'Switched to LED bulbs for energy-efficient lighting.'
  ];
  final List<IconData> icons = [Icons.wb_sunny, Icons.invert_colors, Icons.lightbulb];

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    names.length,
                        (index) => buildCommunityPost(names[index], blurbs[index], icons[index]),
                  ),
                ),
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
      decoration: const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
      child: const Text(
        'Community Energy Saving Stories',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildCommunityPost(String name, String blurb, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.purple),
              SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            blurb,
            style: TextStyle(fontSize: 16),
          ),
        ],
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
      currentIndex: 4,
      onTap: (index) {
        if (index == 4) return; // Prevent navigation to the current page
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
