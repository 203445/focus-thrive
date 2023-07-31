import 'package:flutter/material.dart';

class DataEntryScreen extends StatefulWidget {
  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  String name = '';
  String description = '';
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Location'),
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes utilizar los valores ingresados (name, description, location) como desees.
                // Por ejemplo, guardarlos en una base de datos o enviarlos a través de una API.
                print('Name: $name');
                print('Description: $description');
                print('Location: $location');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
