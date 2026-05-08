import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class FiveSensesExercise extends StatefulWidget {
  final Function(Map<String, dynamic>) onComplete;

  const FiveSensesExercise({
    super.key,
    required this.onComplete,
  });

  @override
  State<FiveSensesExercise> createState() => _FiveSensesExerciseState();
}

class _FiveSensesExerciseState extends State<FiveSensesExercise> {
  int _currentStep = 0;
  final PageController _pageController = PageController();

  final List<String> _seeItems = [];
  final List<String> _touchItems = [];
  final List<String> _hearItems = [];
  final List<String> _smellItems = [];
  final List<String> _tasteItems = [];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress
        LinearProgressIndicator(
          value: (_currentStep + 1) / 6,
          backgroundColor: Colors.grey.shade300,
          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.warningColor),
          minHeight: 4,
        ),

        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildIntroPage(),
              _buildSensePage('See', '👁️', 5, 'Name 5 things you can see', _seeItems),
              _buildSensePage('Touch', '✋', 4, 'Name 4 things you can touch', _touchItems),
              _buildSensePage('Hear', '👂', 3, 'Name 3 things you can hear', _hearItems),
              _buildSensePage('Smell', '👃', 2, 'Name 2 things you can smell', _smellItems),
              _buildSensePage('Taste', '👅', 1, 'Name 1 thing you can taste', _tasteItems),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIntroPage() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          Text(
            '5-4-3-2-1 Grounding',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),

          const Text(
            'This technique uses your five senses to bring you into the present moment.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),

          _buildSensePreview('👁️', '5 things to see'),
          const SizedBox(height: 12),
          _buildSensePreview('✋', '4 things to touch'),
          const SizedBox(height: 12),
          _buildSensePreview('👂', '3 things to hear'),
          const SizedBox(height: 12),
          _buildSensePreview('👃', '2 things to smell'),
          const SizedBox(height: 12),
          _buildSensePreview('👅', '1 thing to taste'),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() => _currentStep++);
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.warningColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Start'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSensePreview(String emoji, String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.warningColor.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSensePage(
      String sense,
      String emoji,
      int count,
      String instruction,
      List<String> items,
      ) {
    final isComplete = items.length >= count;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 48)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sense,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      instruction,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Progress indicator
          Row(
            children: List.generate(count, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 4,
                  decoration: BoxDecoration(
                    color: index < items.length
                        ? AppTheme.warningColor
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),

          // Items list
          Expanded(
            child: ListView.builder(
              itemCount: items.length + (isComplete ? 0 : 1),
              itemBuilder: (context, index) {
                if (index < items.length) {
                  return _buildItemCard(items[index], index, items);
                } else {
                  return _buildAddItemCard(items, count);
                }
              },
            ),
          ),

          // Tip
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_outline, color: AppTheme.primaryColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _getTip(sense),
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Navigation
          Row(
            children: [
              if (_currentStep > 1)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() => _currentStep--);
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Back'),
                  ),
                ),
              if (_currentStep > 1) const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: isComplete ? _handleNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.warningColor,
                  ),
                  child: Text(_currentStep == 5 ? 'Complete' : 'Next'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildItemCard(String item, int index, List<String> items) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.warningColor.withValues(alpha:0.2),
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.warningColor,
            ),
          ),
        ),
        title: Text(item),
        trailing: IconButton(
          icon: const Icon(Icons.close, size: 20),
          onPressed: () {
            setState(() {
              items.removeAt(index);
            });
          },
        ),
      ),
    );
  }

  Widget _buildAddItemCard(List<String> items, int maxCount) {
    final controller = TextEditingController();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppTheme.warningColor.withValues(alpha:0.2),
              child: Text(
                '${items.length + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.warningColor,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Type and press enter...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (value) {
                  if (value.isNotEmpty && items.length < maxCount) {
                    setState(() {
                      items.add(value);
                      controller.clear();
                    });
                  }
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, color: AppTheme.warningColor),
              onPressed: () {
                if (controller.text.isNotEmpty && items.length < maxCount) {
                  setState(() {
                    items.add(controller.text);
                    controller.clear();
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getTip(String sense) {
    switch (sense) {
      case 'See':
        return 'Look around slowly. Notice colors, shapes, and details you normally overlook.';
      case 'Touch':
        return 'Actually touch things. Feel textures, temperatures, and surfaces.';
      case 'Hear':
        return 'Close your eyes if it helps. Listen for both obvious and subtle sounds.';
      case 'Smell':
        return 'Take a deep breath through your nose. Notice any scents in the air.';
      case 'Taste':
        return 'What taste lingers in your mouth? Or what could you taste right now?';
      default:
        return '';
    }
  }

  void _handleNext() {
    if (_currentStep == 5) {
      // Complete exercise
      widget.onComplete({
        'see': _seeItems.join(', '),
        'touch': _touchItems.join(', '),
        'hear': _hearItems.join(', '),
        'smell': _smellItems.join(', '),
        'taste': _tasteItems.join(', '),
      });
    } else {
      setState(() => _currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}