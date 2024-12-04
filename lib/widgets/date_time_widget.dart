import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatelessWidget {
  final Stream<DateTime> dateTimeStream;

  const DateTimeWidget({required this.dateTimeStream, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: dateTimeStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Loading time...",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Error fetching time",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final time = snapshot.data!;
          final formattedTime = DateFormat.yMEd().add_jms().format(time);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              formattedTime,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "No time available",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }
      },
    );
  }
}
