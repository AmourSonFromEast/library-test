import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  final String text;
  final String currentSort;

  final Function(String) onPressed;

  const SortButton({
    Key? key,
    required this.text,
    required this.currentSort,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isActive = currentSort == text;
    return InkWell(
      onTap: () {
        onPressed(text);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class SortButtonsBar extends StatelessWidget {
  final String currentSort;
  final Function(String) onSortChanged;

  const SortButtonsBar({
    Key? key,
    required this.currentSort,
    required this.onSortChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SortButton(
          text: 'По имени',
          currentSort: currentSort,
        
          onPressed: onSortChanged,
        ),
        SortButton(
          text: 'По дате',
          currentSort: currentSort,
       
          onPressed: onSortChanged,
        ),
        SortButton(
          text: 'По рейтингу',
          currentSort: currentSort,
        
          onPressed: onSortChanged,
        ),
      ],
    );
  }
}