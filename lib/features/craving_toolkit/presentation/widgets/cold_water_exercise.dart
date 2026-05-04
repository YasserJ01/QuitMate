import 'package:flutter/material.dart';

class ColdWaterExercise extends StatefulWidget {
  final Function(Map<String, dynamic>) onComplete;

  const ColdWaterExercise({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<ColdWaterExercise> createState() => _ColdWaterExerciseState();
}

class _ColdWaterExerciseState extends State<ColdWaterExercise> {
  bool _hasCompleted = false;

  @override
  Widget build(BuildContext context) {
    if (_hasCompleted) {
      return _buildCompletedScreen();
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          const Icon(
            Icons.water_drop,
            size: 80,
            color: Colors.blue,
          ),
          const SizedBox(height: 24),

          Text(
            'Cold Water Reset',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),

          const Text(
            'Splash cold water on your face to activate your dive reflex and calm your nervous system.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),

          _buildInstructionSteps(),
          const SizedBox(height: 24),

          _buildScienceCard(),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _hasCompleted = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'I\'ve Done It',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildInstructionSteps() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to do it:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            _buildStep(1, 'Go to a sink with cold water'),
            _buildStep(2, 'Cup your hands and fill with cold water'),
            _buildStep(3, 'Splash water on your face 3-5 times'),
            _buildStep(4, 'Hold cold water on your face for 15-30 seconds'),
            _buildStep(5, 'Breathe slowly and notice the sensation'),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int number, String text) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(text),
                ),
              ),
            ],
        ),
    );
  }

  Widget _buildScienceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.science, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'The Science:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Cold water on your face triggers the "dive reflex," which:',
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildSciencePoint('Slows your heart rate'),
          _buildSciencePoint('Activates parasympathetic nervous system'),
          _buildSciencePoint('Redirects blood flow'),
          _buildSciencePoint('Interrupts panic response'),
        ],
      ),
    );
  }

  Widget _buildSciencePoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_right,
            size: 16,
            color: Colors.blue,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedScreen() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 60,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 24),

          Text(
            'Great Job!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),

          const Text(
            'How do you feel now?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notice:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildNoticeItem('Is your heart rate slower?'),
                  _buildNoticeItem('Do you feel more alert?'),
                  _buildNoticeItem('Has the craving intensity changed?'),
                  _buildNoticeItem('Are you more present?'),
                ],
              ),
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onComplete({'completed': true});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Complete Exercise',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildNoticeItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.psychology,
            size: 16,
            color: Colors.blue,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}