import 'package:flutter/material.dart';

class BusDetailPage extends StatelessWidget {
  final String busNumber;
  final String arrivalTime;

  BusDetailPage({required this.busNumber, required this.arrivalTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Detail'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bus Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  'Bus Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  busNumber,
                  style: TextStyle(fontSize: 16),
                ),
                leading: Icon(Icons.directions_bus, color: Colors.cyan),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  'Arrival Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  arrivalTime,
                  style: TextStyle(fontSize: 16),
                ),
                leading: Icon(Icons.access_time, color: Colors.cyan),
              ),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
