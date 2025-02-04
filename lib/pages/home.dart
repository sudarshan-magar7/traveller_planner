import 'package:flutter/material.dart';
import '../widgets/drawer/app_drawer.dart'; // Import the drawer
import 'package:trip_planner_agency/pages/trips.dart';
import 'package:trip_planner_agency/widgets/cards/_buildTripSummaryCard.dart'; // Import the separate Trips page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a ScrollController
  final ScrollController _scrollController = ScrollController();

  // Current selected tab index
  int _selectedIndex = 0;

  // List of widget pages for each tab
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      // Home Page Content
      _HomeContent(scrollController: _scrollController),

      // Trips Page Content
      const TripsPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Planner'),
      ),
      drawer: const AppDrawer(), // Use the imported drawer
      body: _pages[_selectedIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Trips',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: _onItemTapped,
      ),
      // Add the FloatingActionButton that scrolls to the top (only for Home page)
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                // Scroll to the top of the Home page
                (_pages[0] as _HomeContent)._scrollController.animateTo(
                      0, // Scroll position
                      duration:
                          const Duration(seconds: 1), // Duration of the scroll
                      curve: Curves.easeInOut, // Smooth curve
                    );
              },
              child: const Icon(Icons.arrow_upward), // Icon for the button
            )
          : null,
    );
  }
}

// Home Content as a separate stateful widget
class _HomeContent extends StatefulWidget {
  final ScrollController _scrollController;

  const _HomeContent({required ScrollController scrollController})
      : _scrollController = scrollController;

  @override
  __HomeContentState createState() => __HomeContentState();
}

class __HomeContentState extends State<_HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget._scrollController,
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
            // Trip cards
            TripSummaryWidget(
              title: 'Trip to Mussoorie',
              totalDays: '1 day',
              budgetEstimate:
                  '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
              accommodation: 'Zostel Mussoorie (Budget, 800-1200 INR)',
              transportation:
                  'Local taxis, shared jeeps, and on foot (500-800 INR)',
              sceneRecreation:
                  'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
            ),
            TripSummaryWidget(
              title: 'Trip to Mussoorie',
              totalDays: '1 day',
              budgetEstimate:
                  '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
              accommodation: 'Zostel Mussoorie (Budget, 800-1200 INR)',
              transportation:
                  'Local taxis, shared jeeps, and on foot (500-800 INR)',
              sceneRecreation:
                  'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
            ),
            TripSummaryWidget(
              title: 'Trip to Mussoorie',
              totalDays: '1 day',
              budgetEstimate:
                  '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
              accommodation: 'Zostel Mussoorie (Budget, 800-1200 INR)',
              transportation:
                  'Local taxis, shared jeeps, and on foot (500-800 INR)',
              sceneRecreation:
                  'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
            ),
            TripSummaryWidget(
              title: 'Trip to Mussoorie',
              totalDays: '1 day',
              budgetEstimate:
                  '3500-5000 INR (Accommodation: 1000-1500, Activities: 500-1000, Transportation: 1000-1500, Food: 1000-1500)',
              accommodation: 'Zostel Mussoorie (Budget, 800-1200 INR)',
              transportation:
                  'Local taxis, shared jeeps, and on foot (500-800 INR)',
              sceneRecreation:
                  'Fight scene recreation in the forest with dynamic poses, foggy environment, and fast shutter speed.',
            ),
          ],
        ),
      ),
    );
  }
}
