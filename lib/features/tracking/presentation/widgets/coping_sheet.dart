import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../data/models/craving_entry.dart';
import '../providers/tracking_provider.dart';

class CopingSheet extends ConsumerStatefulWidget {
  final VoidCallback? onLogged;
  const CopingSheet({super.key, this.onLogged});

  @override
  ConsumerState<CopingSheet> createState() => _CopingSheetState();
}

class _CopingSheetState extends ConsumerState<CopingSheet> {
  int _selectedIntensity = 3;

  final _intensityLabels = const ['', 'Barely noticed', 'Mild', 'Moderate', 'Strong', 'Overwhelming'];

  Future<void> _logCraving() async {
    final ok = await ref.read(quickLogProvider.notifier).logCraving(
          intensity: _intensityToEnum(_selectedIntensity),
        );
    if (ok && mounted) {
      HapticFeedback.lightImpact();
      widget.onLogged?.call();
      Navigator.pop(context);
    }
  }

  CravingIntensity _intensityToEnum(int level) {
    switch (level) {
      case 1:
        return CravingIntensity.mild;
      case 2:
        return CravingIntensity.moderate;
      case 3:
        return CravingIntensity.moderate;
      case 4:
        return CravingIntensity.strong;
      case 5:
        return CravingIntensity.veryStrong;
      default:
        return CravingIntensity.moderate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: DashboardTheme.textDisabled(context),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Center(
                child: Text(
                  '⚡',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Craving detected',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: DashboardTheme.textPrimary(context),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  'Acknowledge it. It will pass.',
                  style: TextStyle(
                    fontSize: 16,
                    color: DashboardTheme.textSecondary(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 28),

              Text(
                'How strong is it?',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Mild',
                    style: TextStyle(
                      fontSize: 12,
                      color: DashboardTheme.textSecondary(context),
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 8,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
                        activeTrackColor: DashboardTheme.warning(context),
                        inactiveTrackColor: DashboardTheme.warning(context).withValues(alpha: 0.2),
                        thumbColor: DashboardTheme.warning(context),
                      ),
                      child: Slider(
                        value: _selectedIntensity.toDouble(),
                        min: 1,
                        max: 5,
                        divisions: 4,
                        onChanged: (v) => setState(() => _selectedIntensity = v.round()),
                      ),
                    ),
                  ),
                  Text(
                    'Strong',
                    style: TextStyle(
                      fontSize: 12,
                      color: DashboardTheme.textSecondary(context),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DashboardTheme.warning(context).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _intensityLabels[_selectedIntensity],
                    style: TextStyle(
                      color: DashboardTheme.warning(context),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              Text(
                'Quick tools',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _QuickToolCard(
                      icon: Icons.self_improvement,
                      label: 'Open Toolkit',
                      color: DashboardTheme.primary(context),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CravingToolkitScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _QuickToolCard(
                      icon: Icons.access_time,
                      label: 'Delay it',
                      color: DashboardTheme.success(context),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _logCraving,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DashboardTheme.warning(context),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Log Craving',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickToolCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _QuickToolCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_QuickToolCard> createState() => _QuickToolCardState();
}

class _QuickToolCardState extends State<_QuickToolCard> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.95),
      onTapUp: (_) {
        setState(() => _scale = 1.0);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: widget.color.withValues(alpha: 0.25),
            ),
          ),
          child: Column(
            children: [
              Icon(widget.icon, color: widget.color, size: 28),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.color,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
