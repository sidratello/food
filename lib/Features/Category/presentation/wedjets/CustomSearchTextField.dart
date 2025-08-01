import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged; //like void Function(String value)


  const CustomSearchField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search about what you need..',
          suffixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: const Color.fromARGB(137, 238, 238, 238),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none, //لا تعرض أي خط أو إطار (border) حول الحقل.
          ),
        ),
      ),
    );
  }
}
