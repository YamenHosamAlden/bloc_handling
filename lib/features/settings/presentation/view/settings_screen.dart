import 'package:flutter/material.dart';

import 'package:myproject/features/settings/presentation/widgets/language_expansion_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LanguageExpansionTile(),
      ],
    );
  }
}
