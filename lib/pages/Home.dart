import 'package:flutter/material.dart';
import '../widgets/drawer/app_drawer.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of trip data to manage better
    final List<Map<String, String>> trips = [
      {
        'title': 'Trip to Mussoorie',
        'totalDays': '1 day',
        'budgetEstimate':
            '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
        'accommodation': 'Zostel Mussoorie (Budget, 800-1200 INR)',
        'transportation':
            'Local taxis, shared jeeps, and on foot (500-800 INR)',
        'sceneRecreation':
            'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
      },
      // Add more trips here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Planner'),
      ),
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
                    'Upcoming Trips Request\'s',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final trip = trips[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _buildTripSummaryCard(
                      context,
                      trip['title']!,
                      trip['totalDays']!,
                      trip['budgetEstimate']!,
                      trip['accommodation']!,
                      trip['transportation']!,
                      trip['sceneRecreation']!,
                    ),
                  );
                },
                childCount: trips.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
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
        padding: const EdgeInsets.all(16), // Adjusted padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleRow(context, title),
            const SizedBox(height: 20),
            ...buildInfoRows(
              context,
              totalDays,
              budgetEstimate,
              accommodation,
              transportation,
              sceneRecreation,
            ),
            const SizedBox(height: 20),
            _buildActionButton(),
          ],
        ),
      ),
    ),
  );
}

Widget _buildTitleRow(BuildContext context, String title) {
  return Row(
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 22,
                letterSpacing: 0.5,
              ), // Updated to headline6
        ),
      ),
    ],
  );
}

List<Widget> buildInfoRows(
  BuildContext context,
  String totalDays,
  String budgetEstimate,
  String accommodation,
  String transportation,
  String sceneRecreation,
) {
  return [
    _buildInfoRow(context, Icons.calendar_today, 'Total Days', totalDays),
    _buildInfoRow(context, Icons.account_balance_wallet, 'Budget Estimate',
        budgetEstimate),
    _buildInfoRow(context, Icons.hotel, 'Accommodation', accommodation),
    _buildInfoRow(
        context, Icons.directions_car, 'Transportation', transportation),
    _buildInfoRow(
        context, Icons.photo_camera, 'Scene Recreation', sceneRecreation),
  ];
}

Widget _buildInfoRow(
    BuildContext context, IconData icon, String title, String info) {
  return Row(
    children: [
      Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
        size: 24,
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          '$title: $info',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}

Widget _buildActionButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: () {
        // Navigate to detailed trip page
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
  );
}
