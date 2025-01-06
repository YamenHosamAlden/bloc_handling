import 'package:flutter/material.dart';

class SearchDetails extends StatelessWidget {
  final String title;
  const SearchDetails({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
