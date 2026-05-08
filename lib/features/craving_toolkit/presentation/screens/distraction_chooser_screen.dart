import 'package:flutter/material.dart';

class DistractionChooserScreen extends StatelessWidget {
  final int? cravingId;

  const DistractionChooserScreen({
    super.key,
    this.cravingId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Distraction Activities')),
      body: const Center(child: Text('Coming soon!')),
    );
  }
}