import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/alerts_info/data/data_source/alerts_api_service.dart';
import 'package:learning_flutter/features/alerts_info/data/data_source/locations_remote_data_source.dart';
import 'package:learning_flutter/features/alerts_info/data/repositories/locations_repository.dart';
import 'package:learning_flutter/features/alerts_info/presentation/bloc/alerts_bloc.dart';
import 'package:learning_flutter/features/alerts_info/presentation/bloc/alerts_event.dart';
import 'package:learning_flutter/features/alerts_info/presentation/bloc/alerts_state.dart';

class AlertsInfoScreen extends StatelessWidget {
  const AlertsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertsBloc(
        LocationsRepository(
          LocationsRemoteDataSource(AlertsApiClient.create()),
        ),
      )..add(const LoadLocationEvent()),
      child: const _AlertsInfoView(),
    );
  }
}

class _AlertsInfoView extends StatelessWidget {
  const _AlertsInfoView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Info', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: BlocBuilder<AlertsBloc, AlertsState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<AlertsBloc>().add(const RefreshLocationEvent());
            },
            child: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, AlertsState state) {
    if (state.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Determining your location...'),
            ],
          ),
        ),
      );
    }

    if (state.error != null) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red.shade400),
                Text(
                  'Error getting location',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  state.error!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<AlertsBloc>().add(const LoadLocationEvent());
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try again'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Your location:',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.grey.shade600),
            ),
            _buildLocationInfo(context, state.locationJson, state),
            _buildAlertsInfo(context, state),
            if (!state.isTestMode)
              ElevatedButton(
                onPressed: () {
                  context.read<AlertsBloc>().add(const TestLuganskEvent());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text('Test'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo(
    BuildContext context,
    String locationJson,
    AlertsState state,
  ) {
    try {
      final data = jsonDecode(locationJson) as Map<String, dynamic>;

      if (data.containsKey('error')) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red.shade200),
          ),
          child: Text(
            'Error: ${data['error']}',
            style: TextStyle(color: Colors.red.shade700),
            textAlign: TextAlign.center,
          ),
        );
      }

      final address = data['address'] as Map<String, dynamic>?;
      if (address == null) {
        return const Text('No address information available');
      }

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Column(
          children: [
            // Показуємо знайдену локацію з UID
            if (state.matchedLocation != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green.shade700,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Matched Location:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'UID: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          state.matchedLocation!.uid,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            state.matchedLocation!.locationName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            _buildLocationItem(context, 'City', address['city']),
            _buildLocationItem(
              context,
              'Administrative Area',
              address['administrativeArea'],
            ),
            _buildLocationItem(
              context,
              'Sub Administrative Area',
              address['subAdministrativeArea'],
            ),
            _buildLocationItem(context, 'Sub Locality', address['subLocality']),
            _buildLocationItem(context, 'Country', address['country']),
            _buildLocationItem(context, 'Postal Code', address['postalCode']),
            _buildLocationItem(context, 'Street', address['street']),
          ],
        ),
      );
    } catch (e) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange.shade200),
        ),
        child: Text(
          'Invalid JSON data: $e',
          style: TextStyle(color: Colors.orange.shade700),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  Widget _buildLocationItem(BuildContext context, String label, dynamic value) {
    if (value == null || value.toString().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsInfo(BuildContext context, AlertsState state) {
    if (state.userAlert == null) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.green.shade200),
        ),
        child: Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green.shade700, size: 48),
            const SizedBox(height: 12),
            Text(
              'No active alerts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your location is safe',
              style: TextStyle(color: Colors.green.shade600, fontSize: 14),
            ),
          ],
        ),
      );
    }

    final alert = state.userAlert!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning, color: Colors.red.shade700, size: 24),
              const SizedBox(width: 8),
              Text(
                'ACTIVE ALERT',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAlertItem(context, 'Alert Type', alert.alertType),
          _buildAlertItem(context, 'Location', alert.locationTitle),
          _buildAlertItem(context, 'Region', alert.locationOblast),
          _buildAlertItem(
            context,
            'Started At',
            _formatDateTime(alert.startedAt),
          ),
          if (alert.finishedAt != null)
            _buildAlertItem(
              context,
              'Finished At',
              _formatDateTime(alert.finishedAt!),
            ),
          _buildAlertItem(
            context,
            'Updated At',
            _formatDateTime(alert.updatedAt),
          ),
          if (alert.notes != null && alert.notes!.isNotEmpty)
            _buildAlertItem(context, 'Notes', alert.notes!),
        ],
      ),
    );
  }

  Widget _buildAlertItem(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.red.shade700,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      return '${dateTime.day}.${dateTime.month}.${dateTime.year} '
          '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateTimeString;
    }
  }
}
