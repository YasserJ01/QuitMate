import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../../relapse_prevention/data/models/relapse_models.dart';
import '../../../relapse_prevention/presentation/providers/relapse_provider.dart';
import '../../../tracking/data/repositories/coping_repository.dart';
import '../../../tracking/presentation/providers/coping_provider.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';
import '../../../tracking/presentation/widgets/toolkit_strategy_chooser.dart';

class VictorySheet extends ConsumerStatefulWidget {
  const VictorySheet({super.key});

  @override
  ConsumerState<VictorySheet> createState() => _VictorySheetState();
}

class _VictorySheetState extends ConsumerState<VictorySheet> {
  String? _selectedMood;
  String? _selectedStrategy;
  String? _selectedToolkitStrategy;
  final _customController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  RelapseContact? _selectedContact;
  bool _showNewContactForm = false;
  bool _showToolkitChooser = false;

  final _moods = const [
    {'emoji': '😊', 'label': 'Great'},
    {'emoji': '🙂', 'label': 'Good'},
    {'emoji': '😐', 'label': 'Okay'},
    {'emoji': '😰', 'label': 'Still tough'},
  ];

  final _strategies = const [
    {'id': 'walk', 'emoji': '🚶', 'label': 'Went for a walk'},
    {'id': 'water', 'emoji': '💧', 'label': 'Drank water'},
    {'id': 'called', 'emoji': '📞', 'label': 'Called / texted someone'},
    {'id': 'music', 'emoji': '🎵', 'label': 'Listened to music'},
    {'id': 'snack', 'emoji': '🍎', 'label': 'Ate something'},
    {'id': 'shower', 'emoji': '🚿', 'label': 'Took a shower'},
    {'id': 'chore', 'emoji': '🧹', 'label': 'Did a chore / cleaned'},
    {'id': 'exercise', 'emoji': '🏋️', 'label': 'Exercised / worked out'},
    {'id': 'read', 'emoji': '📖', 'label': 'Read something'},
    {'id': 'game', 'emoji': '🎮', 'label': 'Played a game'},
    {'id': 'fresh_air', 'emoji': '🌿', 'label': 'Stepped outside'},
    {'id': 'toolkit', 'emoji': '🧰', 'label': 'Used the toolkit'},
    {'id': 'other', 'emoji': '✏️', 'label': 'Other...'},
  ];

  @override
  void dispose() {
    _customController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    super.dispose();
  }

  void _selectMood(String emoji) {
    setState(() => _selectedMood = emoji);
  }

  void _selectStrategy(String id) {
    setState(() {
      _selectedStrategy = id;
      _showToolkitChooser = id == 'toolkit';
      _showNewContactForm = false;
      _selectedContact = null;
    });
  }

  void _selectContact(RelapseContact? contact) {
    setState(() {
      _selectedContact = contact;
      _showNewContactForm = contact == null;
    });
  }

  Future<void> _saveVictory() async {
    if (_selectedMood == null || _selectedStrategy == null) return;
    if (_selectedStrategy == 'toolkit' && _selectedToolkitStrategy == null) return;
    if (_selectedStrategy == 'other' && _customController.text.trim().isEmpty) return;

    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;

    final strategyValue = _selectedStrategy == 'toolkit'
        ? _selectedToolkitStrategy!
        : _selectedStrategy!;

    final strategyType = _selectedStrategy == 'toolkit'
        ? 'toolkit'
        : _selectedStrategy == 'other'
            ? 'custom'
            : 'predefined';

    String? contactName;
    String? contactPhone;

    if (_selectedStrategy == 'called') {
      if (_selectedContact != null) {
        contactName = _selectedContact!.name;
        contactPhone = _selectedContact!.phoneNumber;
      } else if (_showNewContactForm && _contactNameController.text.trim().isNotEmpty) {
        contactName = _contactNameController.text.trim();
        contactPhone = _contactPhoneController.text.trim().isNotEmpty
            ? _contactPhoneController.text.trim()
            : null;

        if (contactPhone != null) {
          await ref.read(relapseRepositoryProvider).addContact(
                RelapseContact(
                  userId: userId,
                  name: contactName,
                  phoneNumber: contactPhone,
                  relationship: 'Support contact',
                ),
              );
        }
      }
    }

    await ref.read(copingRepositoryProvider).saveVictory(CopingVictoryData(
      userId: userId,
      timestamp: DateTime.now(),
      intensityBefore: 3,
      intensityAfter: 1,
      moodAfter: _selectedMood!,
      strategyType: strategyType,
      strategyValue: strategyValue,
      customStrategy: _selectedStrategy == 'other' ? _customController.text.trim() : null,
      contactName: contactName,
      contactPhone: contactPhone,
    ));

    ref.invalidate(copingVictoriesProvider);
    ref.invalidate(copingStatsProvider);
    ref.invalidate(copingTotalProvider);
    ref.invalidate(copingRecentProvider);

    HapticFeedback.mediumImpact();
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final contactsAsync = ref.watch(relapseContactsProvider);

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
                  '🎉',
                  style: const TextStyle(fontSize: 48),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'You beat the craving!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: DashboardTheme.textPrimary(context),
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  'That took real strength.',
                  style: TextStyle(
                    fontSize: 16,
                    color: DashboardTheme.textSecondary(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 28),

              Text(
                'How do you feel now?',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _moods.map((mood) {
                  final isSelected = _selectedMood == mood['emoji'];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _selectMood(mood['emoji']!),
                      borderRadius: BorderRadius.circular(12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? DashboardTheme.primary(context).withValues(alpha: 0.12)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? DashboardTheme.primary(context)
                                : DashboardTheme.cardBorder(context),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(mood['emoji']!, style: const TextStyle(fontSize: 28)),
                            const SizedBox(height: 4),
                            Text(
                              mood['label']!,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                color: isSelected
                                    ? DashboardTheme.primary(context)
                                    : DashboardTheme.textSecondary(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              Text(
                'How did you do it?',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _strategies.map((s) {
                  final isSelected = _selectedStrategy == s['id'];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _selectStrategy(s['id']!),
                      borderRadius: BorderRadius.circular(10),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? DashboardTheme.primary(context).withValues(alpha: 0.12)
                              : DashboardTheme.surface(context),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected
                                ? DashboardTheme.primary(context)
                                : DashboardTheme.cardBorder(context),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(s['emoji']!, style: const TextStyle(fontSize: 16)),
                            const SizedBox(width: 6),
                            Text(
                              s['label']!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                color: isSelected
                                    ? DashboardTheme.primary(context)
                                    : DashboardTheme.textPrimary(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              if (_showToolkitChooser) ...[
                ToolkitStrategyChooser(
                  onSelected: (strategy) {
                    setState(() => _selectedToolkitStrategy = strategy.id);
                  },
                ),
                const SizedBox(height: 16),
              ],

              if (_selectedStrategy == 'other') ...[
                TextField(
                  controller: _customController,
                  decoration: InputDecoration(
                    hintText: 'How did you beat the craving?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: DashboardTheme.background(context),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
              ],

              if (_selectedStrategy == 'called') ...[
                contactsAsync.when(
                  loading: () => const Center(child: Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)),
                  )),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (contacts) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.contacts, color: DashboardTheme.primary(context), size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'Who did you call?',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: DashboardTheme.textPrimary(context),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (contacts.isNotEmpty) ...[
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: contacts.map((contact) {
                              final isSelected = _selectedContact?.id == contact.id;
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => _selectContact(contact),
                                  borderRadius: BorderRadius.circular(10),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? DashboardTheme.primary(context).withValues(alpha: 0.12)
                                          : DashboardTheme.background(context),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: isSelected
                                            ? DashboardTheme.primary(context)
                                            : DashboardTheme.cardBorder(context),
                                        width: isSelected ? 2 : 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.person, size: 16),
                                        const SizedBox(width: 6),
                                        Text(
                                          contact.name,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                            color: isSelected
                                                ? DashboardTheme.primary(context)
                                                : DashboardTheme.textPrimary(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 10),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => _selectContact(null),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                  color: _showNewContactForm
                                      ? DashboardTheme.primary(context).withValues(alpha: 0.12)
                                      : DashboardTheme.background(context),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: _showNewContactForm
                                        ? DashboardTheme.primary(context)
                                        : DashboardTheme.cardBorder(context),
                                    width: _showNewContactForm ? 2 : 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.add_circle_outline, size: 16,
                                        color: DashboardTheme.primary(context)),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Add new contact',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: _showNewContactForm ? FontWeight.w700 : FontWeight.w500,
                                        color: DashboardTheme.primary(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        if (_showNewContactForm) ...[
                          const SizedBox(height: 12),
                          TextField(
                            controller: _contactNameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: DashboardTheme.surface(context),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _contactPhoneController,
                            decoration: InputDecoration(
                              hintText: 'Phone number (optional)',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: DashboardTheme.surface(context),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                        if (contacts.isEmpty) ...[
                          const SizedBox(height: 10),
                          TextField(
                            controller: _contactNameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: DashboardTheme.surface(context),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _contactPhoneController,
                            decoration: InputDecoration(
                              hintText: 'Phone number (optional)',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: DashboardTheme.surface(context),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (_selectedMood != null && _selectedStrategy != null)
                      ? _saveVictory
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Save Victory',
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
