import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/core/theme/app_theme.dart';
import 'package:quitmate/core/widgets/common_widgets.dart';

import '../providers/onboarding_provider.dart';
import '../../../interventions/presentation/providers/notification_provider.dart';
import '../../../tracking/presentation/screens/dashboard_screen.dart';

class QuitDateScreen extends ConsumerStatefulWidget {
  const QuitDateScreen({super.key});

  @override
  ConsumerState<QuitDateScreen> createState() => _QuitDateScreenState();
}

class _QuitDateScreenState extends ConsumerState<QuitDateScreen> {
  DateTime? _selectedDate;
  final List<int> _quickDays = [0, 1, 3, 7, 14, 30];

  @override
  void initState() {
    super.initState();
    _selectedDate = ref.read(onboardingProvider).quitDate;
  }

  void _selectQuickDate(int days) {
    final date = DateTime.now().add(Duration(days: days));
    setState(() => _selectedDate = date);
    ref.read(onboardingProvider.notifier).setQuitDate(date);
  }

  Future<void> _selectCustomDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: AppTheme.primaryColor),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
      ref.read(onboardingProvider.notifier).setQuitDate(picked);
    }
  }

  Future<void> _completeOnboarding() async {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a quit date'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    // 1. Persist profile + userId to secure storage
    final success =
    await ref.read(onboardingProvider.notifier).completeOnboarding();

    if (!mounted) return;

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ref.read(onboardingProvider).error ?? 'Failed to complete setup',
          ),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    // 2. Bootstrap notifications for the new user (non-blocking — any error is
    //    logged and swallowed so the app still navigates to the dashboard).
    _scheduleFirstNotifications();

    // 3. Navigate to dashboard
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
            (route) => false,
      );
    }
  }

  Future<void> _scheduleFirstNotifications() async {
    try {
      final userId = ref.read(onboardingProvider).userId;
      final manager =
      await ref.read(notificationManagerProvider.future);

      final granted = await manager.requestPermissions();
      if (!granted) return;

      await manager.scheduleAll(userId);
      await manager.schedulePreventive(userId);
    } catch (e) {
      debugPrint('First-run notification scheduling failed: $e');
    }
  }

  String _quickLabel(int days) {
    if (days == 0) return 'Today';
    if (days == 1) return 'Tomorrow';
    return 'In $days days';
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: LoadingOverlay(
        isLoading: state.isLoading,
        message: 'Setting up your journey…',
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                Text(
                  AppStrings.quitDateTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.quitDateSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 32),

                // ── Selected date display ────────────────────────────────
                if (_selectedDate != null)
                  _SelectedDateCard(date: _selectedDate!),

                const SizedBox(height: 24),

                // ── Quick options ────────────────────────────────────────
                Text('Quick options',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _quickDays.map((days) {
                    final candidate =
                    DateTime.now().add(Duration(days: days));
                    final selected = _selectedDate != null &&
                        _isSameDay(_selectedDate!, candidate);
                    return OutlinedButton(
                      onPressed: () => _selectQuickDate(days),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selected
                            ? AppTheme.primaryColor.withOpacity(0.1)
                            : null,
                        side: BorderSide(
                          color: selected
                              ? AppTheme.primaryColor
                              : Colors.grey.shade300,
                          width: selected ? 2 : 1,
                        ),
                      ),
                      child: Text(_quickLabel(days)),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // ── Custom date picker ───────────────────────────────────
                OutlinedButton.icon(
                  onPressed: _selectCustomDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Choose custom date'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),

                const SizedBox(height: 32),

                // ── Research tip ─────────────────────────────────────────
                Card(
                  color: AppTheme.warningColor.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb_outline,
                            color: AppTheme.warningColor),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Research shows that setting a specific quit date '
                                'increases your chances of success.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ── Finish ───────────────────────────────────────────────
                GradientButton(
                  text: AppStrings.finish,
                  onPressed:
                  _selectedDate != null ? _completeOnboarding : null,
                  icon: Icons.check,
                  isLoading: state.isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Selected date card ───────────────────────────────────────────────────────

class _SelectedDateCard extends StatelessWidget {
  final DateTime date;
  const _SelectedDateCard({required this.date});

  static const _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];
  static const _shortMonths = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // Calendar chip
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${date.day}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _shortMonths[date.month - 1],
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your quit date',
                    style: TextStyle(
                        fontSize: 14, color: AppTheme.textSecondary),
                  ),
                  Text(
                    '${_months[date.month - 1]} ${date.day}, ${date.year}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Icon(Icons.check_circle,
                color: AppTheme.successColor, size: 32),
          ],
        ),
      ),
    );
  }
}