import 'package:flutter/material.dart';

class ItineraryForm extends StatefulWidget {
  const ItineraryForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItineraryFormState createState() => _ItineraryFormState();
}

class _ItineraryFormState extends State<ItineraryForm> {
  final _formKey = GlobalKey<FormState>();

  // Trip Overview Controllers
  TextEditingController totalDaysController = TextEditingController(text: "1");

  // Budget Controllers
  TextEditingController accommodationBudgetController =
      TextEditingController(text: "1000-1500");
  TextEditingController activitiesBudgetController =
      TextEditingController(text: "500-1000");
  TextEditingController transportationBudgetController =
      TextEditingController(text: "1000-1500");
  TextEditingController foodBudgetController =
      TextEditingController(text: "1000-1500");

  // Location Data Structure
  List<LocationData> locations = [
    LocationData(
      title: "Location 1",
      name: "Mall Road, Mussoorie",
      timing: "Morning (9:00 AM - 12:00 PM)",
      activities: [
        "Explore the bustling Mall Road",
        "Shop for local handicrafts",
        "Enjoy street food"
      ],
    ),
    LocationData(
      title: "Location 2",
      name: "Trek near the forests surrounding Mussoorie",
      timing: "Afternoon (1:00 PM - 5:00 PM)",
      activities: [
        "Trekking through forests",
        "Nature photography",
        "Enjoying tranquility"
      ],
    ),
    LocationData(
      title: "Location 3",
      name: "Gun Hill",
      timing: "Evening (5:00 PM - 7:00 PM)",
      activities: ["Cable car ride", "Panoramic views", "Photography"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Itinerary'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, "/home");
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Trip Overview'),
              _buildInputField(
                'Total Days',
                totalDaysController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 24),
              _buildSectionTitle('Budget Breakdown (INR)'),
              _buildInputField(
                  'Accommodation Budget', accommodationBudgetController),
              _buildInputField('Activities Budget', activitiesBudgetController),
              _buildInputField(
                  'Transportation Budget', transportationBudgetController),
              _buildInputField('Food Budget', foodBudgetController),
              SizedBox(height: 24),
              _buildSectionTitle('Locations'),
              ...locations.asMap().entries.map((entry) => Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: _buildLocationCard(entry.value, entry.key),
                  )),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Update Itinerary',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 24,
            ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller, {
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLocationCard(LocationData location, int index) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            TextFormField(
              initialValue: location.name,
              onChanged: (value) => setState(() => location.name = value),
              decoration: InputDecoration(
                labelText: 'Location Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: location.timing,
              onChanged: (value) => setState(() => location.timing = value),
              decoration: InputDecoration(
                labelText: 'Timing',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Activities:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ...location.activities.asMap().entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(left: 16, top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: entry.value,
                        onChanged: (value) => setState(
                            () => location.activities[entry.key] = value),
                        decoration: InputDecoration(
                          labelText: 'Activity ${entry.key + 1}',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => setState(
                          () => location.activities.removeAt(entry.key)),
                    ),
                  ],
                ),
              );
            }),
            TextButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add Activity'),
              onPressed: () => setState(() => location.activities.add('')),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Here you can access all the updated data from controllers and locations list
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Itinerary updated successfully!'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      );
    }
  }

  @override
  void dispose() {
    totalDaysController.dispose();
    accommodationBudgetController.dispose();
    activitiesBudgetController.dispose();
    transportationBudgetController.dispose();
    foodBudgetController.dispose();
    super.dispose();
  }
}

class LocationData {
  String title;
  String name;
  String timing;
  List<String> activities;

  LocationData({
    required this.title,
    required this.name,
    required this.timing,
    required this.activities,
  });
}
