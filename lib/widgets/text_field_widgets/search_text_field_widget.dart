import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Function(String)? onChanged;

  const SearchTextField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Pesquisar...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}