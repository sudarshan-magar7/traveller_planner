import 'package:flutter/material.dart';
import '../widgets/drawer/app_drawer.dart'; // Import the drawer

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a ScrollController
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Planner'),
      ),
      drawer: const AppDrawer(), // Use the imported drawer
      body: SingleChildScrollView(
        controller:
            _scrollController, // Assign the ScrollController to the SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Your Travel Planner',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search destinations...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Upcoming Trips Request${"'s"}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              // Add your trip cards here
              _buildTripSummaryCard(
                context,
                'Trip to Mussoorie',
                '1 day',
                '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
                'Zostel Mussoorie (Budget, 800-1200 INR)',
                'Local taxis, shared jeeps, and on foot (500-800 INR)',
                'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
              ),
              _buildTripSummaryCard(
                context,
                'Trip to Mussoorie',
                '1 day',
                '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
                'Zostel Mussoorie (Budget, 800-1200 INR)',
                'Local taxis, shared jeeps, and on foot (500-800 INR)',
                'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
              ),
              _buildTripSummaryCard(
                context,
                'Trip to Mussoorie',
                '1 day',
                '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
                'Zostel Mussoorie (Budget, 800-1200 INR)',
                'Local taxis, shared jeeps, and on foot (500-800 INR)',
                'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
              ),
            ],
          ),
        ),
      ),
      // Add the FloatingActionButton that scrolls to the top
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Scroll to the top
          _scrollController.animateTo(
            0, // Scroll position
            duration: const Duration(seconds: 1), // Duration of the scroll
            curve: Curves.easeInOut, // Smooth curve
          );
        },
        child: const Icon(Icons.arrow_upward), // Icon for the button
      ),
    );
  }

  Widget _buildTripSummaryCard(
    BuildContext context,
    String title,
    String totalDays,
    String budgetEstimate,
    String accommodation,
    String transportation,
    String sceneRecreation,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.flight_takeoff,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 22,
                                letterSpacing: 0.5,
                              ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildInfoRow(
                context,
                Icons.calendar_today,
                'Total Days',
                totalDays,
              ),
              _buildInfoRow(
                context,
                Icons.account_balance_wallet,
                'Budget Estimate',
                budgetEstimate,
              ),
              _buildInfoRow(
                context,
                Icons.hotel,
                'Accommodation',
                accommodation,
              ),
              _buildInfoRow(
                context,
                Icons.directions_car,
                'Transportation',
                transportation,
              ),
              _buildInfoRow(
                context,
                Icons.photo_camera,
                'Scene Recreation',
                sceneRecreation,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to detailed trip page
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  icon: const Icon(Icons.visibility),
                  label: const Text(
                    'View Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
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
