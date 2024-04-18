import 'package:flutter/material.dart';

class FilterSection extends StatefulWidget {
  final String heading;
  final List<String> options;
  final ValueChanged<String> onSelect;

  FilterSection({
    required this.heading,
    required this.options,
    required this.onSelect,
  });

  @override
  _FilterSectionState createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    // Initialize selectedOption with the default choose value
    selectedOption = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            widget.heading,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(widget.options.length, (index) {
            final option = widget.options[index];
            return FilterButton(
              text: option,
              isSelected: selectedOption == option,
              onTap: () {
                setState(() {
                  selectedOption = option;
                  // Notify parent widget about the selected option
                  widget.onSelect(selectedOption);
                });
              },
            );
          }),
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  FilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
