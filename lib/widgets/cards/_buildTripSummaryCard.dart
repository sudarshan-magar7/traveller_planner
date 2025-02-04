import 'package:flutter/material.dart';

class TripSummaryWidget extends StatefulWidget {
  final String title;
  final String totalDays;
  final String budgetEstimate;
  final String accommodation;
  final String transportation;
  final String sceneRecreation;

  const TripSummaryWidget({
    super.key,
    required this.title,
    required this.totalDays,
    required this.budgetEstimate,
    required this.accommodation,
    required this.transportation,
    required this.sceneRecreation,
  });

  @override
  State<TripSummaryWidget> createState() => _TripSummaryWidgetState();
}

class _TripSummaryWidgetState extends State<TripSummaryWidget> {
  Widget _buildTripSummaryCard(BuildContext context) {
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
                      widget.title,
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
                widget.totalDays,
              ),
              _buildInfoRow(
                context,
                Icons.account_balance_wallet,
                'Budget Estimate',
                widget.budgetEstimate,
              ),
              _buildInfoRow(
                context,
                Icons.hotel,
                'Accommodation',
                widget.accommodation,
              ),
              _buildInfoRow(
                context,
                Icons.directions_car,
                'Transportation',
                widget.transportation,
              ),
              _buildInfoRow(
                context,
                Icons.photo_camera,
                'Scene Recreation',
                widget.sceneRecreation,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _handleViewDetails,
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

  void _handleViewDetails() {
    // Navigate to detailed trip page
    Navigator.pushReplacementNamed(context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    return _buildTripSummaryCard(context);
  }
}
