import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../core/theme/app_theme.dart';

class BodyScanExercise extends StatefulWidget {
  final Function(Map<String, dynamic>) onComplete;

  const BodyScanExercise({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<BodyScanExercise> createState() => _BodyScanExerciseState();
}

class _BodyScanExerciseState extends State<BodyScanExercise> {
  int _currentBodyPart = 0;
  bool _isScanning = false;
  Timer? _timer;
  int _scanDuration = 10; // seconds per body part

  final List<Map<String, dynamic>> _bodyParts = [
    {'name': 'Feet & Toes', 'icon': '🦶', 'position': 0.9},
    {'name': 'Legs & Knees', 'icon': '🦵', 'position': 0.7},
    {'name': 'Hips & Lower Back', 'icon': '🫁', 'position': 0.55},
    {'name': 'Stomach & Chest', 'icon': '💚', 'position': 0.45},
    {'name': 'Shoulders & Neck', 'icon': '💪', 'position': 0.3},
    {'name': 'Arms & Hands', 'icon': '👐', 'position': 0.35},
    {'name': 'Face & Head', 'icon': '🧠', 'position': 0.1},
  ];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startScan() {
    setState(() {
      _isScanning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_scanDuration > 0) {
        setState(() {
          _scanDuration--;
        });
      } else {
        if (_currentBodyPart < _bodyParts.length - 1) {
          setState(() {
            _currentBodyPart++;
            _scanDuration = 10;
          });
        } else {
          timer.cancel();
          widget.onComplete({'completed': true});
        }
      }
    });
  }

  void _nextBodyPart() {
    if (_currentBodyPart < _bodyParts.length - 1) {
      setState(() {
        _currentBodyPart++;
        _scanDuration = 10;
      });
    } else {
      _timer?.cancel();
      widget.onComplete({'completed': true});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isScanning) {
      return _buildIntroScreen();
    }

    final currentPart = _bodyParts[_currentBodyPart];

    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
        // Progress
        Text(
        'Part ${_currentBodyPart + 1} of ${_bodyParts.length}',
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: (_currentBodyPart + 1) / _bodyParts.length,
          backgroundColor: Colors.grey.shade300,
          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.warningColor),
        ),
        const SizedBox(height: 32),

        // Body visualization
        Expanded(
            child: Stack(
                alignment: Alignment.center,
                children: [
                // Body outline
                CustomPaint(
                size: Size(200, MediaQuery.of(context).size.height * 0.5),
            painter: BodyOutlinePainter(highlightPosition: currentPart['position'],
            ),
                ),

                  // Current body part indicator
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.5 * currentPart['position'],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppTheme.warningColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.warningColor.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentPart['icon'],
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            currentPart['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            ),
        ),

            const SizedBox(height: 24),

            // Timer
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.warningColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    '$_scanDuration',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.warningColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Focus on this area...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Instructions
            _buildInstructions(currentPart['name']),
            const SizedBox(height: 24),

            // Skip button
            OutlinedButton(
              onPressed: _nextBodyPart,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Skip to Next Part'),
            ),
            const SizedBox(height: 16),
          ],
        ),
    );
  }

  Widget _buildIntroScreen() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          const Icon(
            Icons.self_improvement,
            size: 80,
            color: AppTheme.warningColor,
          ),
          const SizedBox(height: 24),

          Text(
            'Body Scan Meditation',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),

          const Text(
            'Take 3 minutes to scan your body from feet to head, noticing any sensations without judgment.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),

          _buildInstructionCard(),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _startScan,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.warningColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Begin Body Scan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildInstructionCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to Practice:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            _buildInstructionItem('Notice sensations without trying to change them'),
            _buildInstructionItem('Breathe naturally and stay relaxed'),
            _buildInstructionItem('If your mind wanders, gently bring it back'),
            _buildInstructionItem('There\'s no right or wrong way to feel'),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            size: 8,
            color: AppTheme.warningColor,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildInstructions(String bodyPart) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.info_outline, size: 20, color: AppTheme.primaryColor),
              SizedBox(width: 8),
              Text(
                'Notice:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...(_getBodyPartInstructions(bodyPart).map((instruction) =>
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '• $instruction',
                  style: const TextStyle(fontSize: 13),
                ),
              )
          )),
        ],
      ),
    );
  }

  List<String> _getBodyPartInstructions(String bodyPart) {
    switch (bodyPart) {
      case 'Feet & Toes':
        return [
          'Temperature of your feet',
          'Contact with the floor or shoes',
          'Any tingling or tension',
        ];
      case 'Legs & Knees':
        return [
          'Weight distribution',
          'Muscle tension or relaxation',
          'Temperature and blood flow',
        ];
      case 'Hips & Lower Back':
        return [
          'Pressure points where sitting',
          'Any tightness or discomfort',
          'Natural curve of your spine',
        ];
      case 'Stomach & Chest':
        return [
          'Movement with each breath',
          'Any tension or butterflies',
          'Rhythm of your heartbeat',
        ];
      case 'Shoulders & Neck':
        return [
          'Are they raised or relaxed?',
          'Any tension or tightness',
          'Connection to your head',
        ];
      case 'Arms & Hands':
        return [
          'Position and weight',
          'Temperature of your hands',
          'Any tingling in fingertips',
        ];
      case 'Face & Head':
        return [
          'Jaw tension or relaxation',
          'Forehead and eye muscles',
          'Scalp and crown of head',
        ];
      default:
        return ['Notice any sensations'];
    }
  }
}

class BodyOutlinePainter extends CustomPainter {
  final double highlightPosition;

  BodyOutlinePainter({required this.highlightPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.warningColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final highlightPaint = Paint()
      ..color = AppTheme.warningColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final centerX = size.width / 2;

    // Draw body outline
    final path = Path();

    // Head
    path.addOval(Rect.fromCircle(
      center: Offset(centerX, size.height * 0.1),
      radius: 30,
    ));

    // Neck
    path.moveTo(centerX - 15, size.height * 0.13);
    path.lineTo(centerX - 15, size.height * 0.2);
    path.moveTo(centerX + 15, size.height * 0.13);
    path.lineTo(centerX + 15, size.height * 0.2);

    // Shoulders
    path.moveTo(centerX - 15, size.height * 0.2);
    path.lineTo(centerX - 50, size.height * 0.25);
    path.moveTo(centerX + 15, size.height * 0.2);
    path.lineTo(centerX + 50, size.height * 0.25);

    // Arms
    path.moveTo(centerX - 50, size.height * 0.25);
    path.lineTo(centerX - 60, size.height * 0.5);
    path.moveTo(centerX + 50, size.height * 0.25);
    path.lineTo(centerX + 60, size.height * 0.5);

    // Torso
    path.moveTo(centerX - 15, size.height * 0.2);
    path.lineTo(centerX - 25, size.height * 0.6);
    path.moveTo(centerX + 15, size.height * 0.2);
    path.lineTo(centerX + 25, size.height * 0.6);

    // Legs
    path.moveTo(centerX - 25, size.height * 0.6);
    path.lineTo(centerX - 20, size.height * 0.95);
    path.moveTo(centerX + 25, size.height * 0.6);
    path.lineTo(centerX + 20, size.height * 0.95);

    canvas.drawPath(path, paint);

    // Draw highlight glow
    final glowY = size.height * highlightPosition;
    final glowPaint = Paint()
      ..color = AppTheme.warningColor.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawCircle(
      Offset(centerX, glowY),
      40,
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(BodyOutlinePainter oldDelegate) {
    return oldDelegate.highlightPosition != highlightPosition;
  }
}