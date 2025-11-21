import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/common_widgets.dart';
import '../providers/onboarding_provider.dart';
import '../../../tracking/presentation/screens/dashboard_screen.dart';

class QuitDateScreen extends ConsumerStatefulWidget {
  const QuitDateScreen({Key? key}) : super(key: key);

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
    setState(() {
      _selectedDate = DateTime.now().add(Duration(days: days));
    });
    ref.read(onboardingProvider.notifier).setQuitDate(_selectedDate!);
  }

  Future<void> _selectCustomDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
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

    final success =
        await ref.read(onboardingProvider.notifier).completeOnboarding();

    if (!mounted) return;

    if (success) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ref.read(onboardingProvider).error ?? 'Failed to complete setup',
          ),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  String _getQuickDateLabel(int days) {
    if (days == 0) return 'Today';
    if (days == 1) return 'Tomorrow';
    return 'In $days days';
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: LoadingOverlay(
        isLoading: onboardingState.isLoading,
        message: 'Setting up your journey...',
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
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

                // Selected Date Display
                if (_selectedDate != null)
                  Card(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
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
                                  _selectedDate!.day.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _getMonthName(_selectedDate!.month),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
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
                                  'Your Quit Date',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                Text(
                                  _formatDate(_selectedDate!),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.check_circle,
                            color: AppTheme.successColor,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),

                // Quick Date Options
                Text(
                  'Quick Options',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _quickDays.map((days) {
                    final date = DateTime.now().add(Duration(days: days));
                    final isSelected = _selectedDate != null &&
                        _isSameDay(_selectedDate!, date);

                    return OutlinedButton(
                      onPressed: () => _selectQuickDate(days),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isSelected
                            ? AppTheme.primaryColor.withOpacity(0.1)
                            : null,
                        side: BorderSide(
                          color: isSelected
                              ? AppTheme.primaryColor
                              : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Text(_getQuickDateLabel(days)),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Custom Date Button
                OutlinedButton.icon(
                  onPressed: _selectCustomDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Choose Custom Date'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),

                const Spacer(),

                // Info Card
                Card(
                  color: AppTheme.warningColor.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lightbulb_outline,
                          color: AppTheme.warningColor,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Research shows that setting a specific quit date increases your chances of success.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Finish Button
                SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: AppStrings.finish,
                    onPressed:
                        _selectedDate != null ? _completeOnboarding : null,
                    icon: Icons.check,
                    isLoading: onboardingState.isLoading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
