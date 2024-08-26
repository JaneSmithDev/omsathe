import 'package:flutter/material.dart';
import 'package:home/result.dart'; // Import the ResultPage

class DetailPage extends StatefulWidget {
  final String title;

  DetailPage({required this.title});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? _selectedStartCity;
  String? _selectedEndCity;
  String? _selectedStartStop;
  String? _selectedEndStop;

  // City and stop options
  final Map<String, List<String>> _cityStops = {
    'Pune': ['vallabhnager', 'B', 'C'],
    'Mumbai': ['D', 'C', 'A'],
    'Solapur': ['krudwadi','C', 'A'],
  };

  void _navigateToResultPage() {
    if (_selectedStartStop == null || _selectedEndStop == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both stops')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          startLocation: _selectedStartStop!,
          endLocation: _selectedEndStop!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 4,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [

          IconButton(
            icon: Icon(Icons.help_rounded, color: Colors.white),
            onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => help()));

            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/bus.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Start City Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedStartCity,
                  hint: Text('Select Your city'),
                  items: _cityStops.keys.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStartCity = value;
                      _selectedStartStop = null; // Reset selected stop
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Start Stop Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedStartStop,
                  hint: Text('Select Nearest stop'),
                  items: _selectedStartCity == null
                      ? []
                      : _cityStops[_selectedStartCity!]!.map((stop) {
                    return DropdownMenuItem<String>(
                      value: stop,
                      child: Text(stop),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStartStop = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                    Center(child: Icon(Icons.route_rounded, size: 60,color: Colors.black,)),
                SizedBox(height: 16),

                // End City Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedEndCity,
                  hint: Text('Select Destination'),
                  items: _cityStops.keys.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedEndCity = value;
                      _selectedEndStop = null; // Reset selected stop
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // End Stop Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedEndStop,
                  hint: Text('Select end stop'),
                  items: _selectedEndCity == null
                      ? []
                      : _cityStops[_selectedEndCity!]!.map((stop) {
                    return DropdownMenuItem<String>(
                      value: stop,
                      child: Text(stop),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedEndStop = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _navigateToResultPage,
                    child: Text('Get Bus Information'),
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
class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Please provide the following information to assist you:\n\n'
              '1. **Current City:**\n'
              '   - Enter the name of the city where you are currently located.\n\n'
              '2. **Current District:**\n'
              '   - Specify the district within your current city.\n\n'
              '3. **Current Stop:**\n'
              '   - Provide the name of the nearest stop or landmark to your current location.\n\n'
              '4. **Destination City:**\n'
              '   - Enter the name of the city where you want to travel to.\n\n'
              '5. **Destination Stop:**\n'
              '   - Specify the name of the stop or landmark in your destination city.\n\n'
              '**Example:**\n'
              '- **Current City:** San Francisco\n'
              '- **Current District:** Downtown\n'
              '- **Current Stop:** Market Street\n'
              '- **Destination City:** Los Angeles\n'
              '- **Destination Stop:** Hollywood Boulevard\n\n'
              'Providing these details will help us assist you better. If you\'re unsure, use the most recognizable landmarks or nearby locations.',
          style: TextStyle(fontSize: 16.0),
        ),
      ),

    );
  }
}
