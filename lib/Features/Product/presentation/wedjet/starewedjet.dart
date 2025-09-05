import 'package:flutter/material.dart';

class StarSelector extends StatefulWidget {
  final int initial;
  final ValueChanged<int> onChanged;
  const StarSelector({super.key, this.initial = 0, required this.onChanged});

  @override
  State<StarSelector> createState() => _StarSelectorState();
}

class _StarSelectorState extends State<StarSelector> {
  late int value = widget.initial;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        final index = i + 1;
        final filled = index <= value;
        return IconButton(
          iconSize: 36,
          onPressed: () {
            setState(() => value = index);
            widget.onChanged(value);
          },
          icon: Icon(
            filled ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        );
      }
      ),
    );
  }
}
