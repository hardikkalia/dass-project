import 'package:flutter/material.dart';

class DateRange extends StatefulWidget {
  final String heading;
  final ValueChanged<DateTimeRange?> onRangeSelected;
  // final DateTime start;
  // final DateTime end;
  const DateRange({super.key, 
    required this.heading,
    required this.onRangeSelected,
    // required this.start,
    // required this.end,
  });

  @override
  DateRangeState createState() => DateRangeState();
}

class DateRangeState extends State<DateRange> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? (_startDate ?? DateTime.now()) : (_endDate ?? DateTime.now()),
      firstDate: DateTime.now().subtract(const Duration(days: 365)), // One year before today
      lastDate: DateTime.now().add(const Duration(days: 365)), // One year after today
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }

        // Ensure both start and end dates are selected and start date is before end date
        if (_startDate != null && _endDate != null && _startDate!.isBefore(_endDate!)) {
          widget.onRangeSelected(DateTimeRange(start: _startDate!, end: _endDate!)); // Invoke callback with date range
          print('Start Date: ${_formatDate(_startDate!)}');
          print('End Date: ${_formatDate(_endDate!)}');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
            child: Text(
            widget.heading,
            style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            ),
          ),
          ),

        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _selectDate(context, true),
              child: AbsorbPointer(
                absorbing: true, // Prevent taps on the text field
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: _startDate != null ? _formatDate(_startDate!) : 'Select Start Date',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0), // Add spacing between text fields
          Expanded(
            child: GestureDetector(
              onTap: () => _selectDate(context, false),
              child: AbsorbPointer(
                absorbing: true, // Prevent taps on the text field
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: _endDate != null ? _formatDate(_endDate!) : 'Select End Date',
                  ),
                ),
              ),
            ),
          ),
        ],
    )
    ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
