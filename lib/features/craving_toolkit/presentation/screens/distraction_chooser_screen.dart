import 'package:flutter/material.dart';

class DistractionChooserScreen extends StatelessWidget {
  final int? cravingId;

  const DistractionChooserScreen({
    Key? key,
    this.cravingId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Distraction Activities')),
      body: const Center(child: Text('Coming soon!')),
    );
  }
}