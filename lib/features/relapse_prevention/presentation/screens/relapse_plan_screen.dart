import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../../data/models/relapse_models.dart';
import '../providers/relapse_provider.dart';
import '../widgets/contact_card.dart';
import 'edit_panic_steps_screen.dart';
import 'edit_custom_steps_screen.dart';

class RelapsePlanScreen extends ConsumerStatefulWidget {
  const RelapsePlanScreen({super.key});

  @override
  ConsumerState<RelapsePlanScreen> createState() => _RelapsePlanScreenState();
}

class _RelapsePlanScreenState extends ConsumerState<RelapsePlanScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(relapseNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.relapsePlanTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'My Plan', icon: Icon(Icons.list_alt)),
            Tab(text: 'Contacts', icon: Icon(Icons.contacts)),
          ],
        ),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (data) => TabBarView(
          controller: _tabController,
          children: [
            _buildPlanTab(data),
            _buildContactsTab(data),
          ],
        ),
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton.extended(
              onPressed: () => _showAddContactDialog(),
              icon: const Icon(Icons.add),
              label: const Text(AppStrings.addContact),
            )
          : null,
    );
  }

  Widget _buildPlanTab(RelapseState state) {
    if (state.plan == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(relapseNotifierProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Panic Mode Steps Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('🆘', style: TextStyle(fontSize: 24)),
                          const SizedBox(width: 12),
                          Text(
                            AppStrings.panicStepsTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditPanicStepsScreen(),
                            ),
                          );
                        },
                        child: const Text('Edit'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Quick 3-step plan for emergency situations',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...state.plan!.panicSteps.asMap().entries.map((entry) {
                    final index = entry.key;
                    final step = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withValues(alpha:0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(step.icon, style: const TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              step.title,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Custom Steps Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.customStepsTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditCustomStepsScreen(
                                    initialSteps: state.plan!.customSteps,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Edit'),
                          ),
                          TextButton(
                            onPressed: () {
                              ref.read(relapseNotifierProvider.notifier).resetCustomSteps();
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Steps to follow if you experience a relapse',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (state.plan!.customSteps.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('No custom steps yet. Tap Edit to add some.'),
                      ),
                    )
                  else
                    ...state.plan!.customSteps.asMap().entries.map((entry) {
                      final index = entry.key;
                      final step = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}.',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                step,
                                style: const TextStyle(height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactsTab(RelapseState state) {
    if (state.contacts.isEmpty) {
      return EmptyState(
        icon: Icons.contacts_outlined,
        title: AppStrings.noContacts,
        subtitle: AppStrings.noContactsSubtitle,
        action: ElevatedButton.icon(
          onPressed: () => _showAddContactDialog(),
          icon: const Icon(Icons.add),
          label: const Text(AppStrings.addContact),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(relapseNotifierProvider);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.contacts.length,
        itemBuilder: (context, index) {
          final contact = state.contacts[index];
          return ContactCard(
            contact: contact,
            onEdit: () => _showEditContactDialog(contact),
            onDelete: () => _confirmDeleteContact(contact),
          );
        },
      ),
    );
  }

  void _showAddContactDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final relationshipController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.addContact),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name *',
                  hintText: 'Enter contact name',
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number (optional)',
                  hintText: 'Enter phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: relationshipController,
                decoration: const InputDecoration(
                  labelText: 'Relationship (optional)',
                  hintText: 'e.g., Friend, Sponsor, Family',
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: notesController,
                decoration: const InputDecoration(
                  labelText: 'Notes (optional)',
                  hintText: 'Any additional notes',
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a name')),
                );
                return;
              }

              final contact = RelapseContact(
                userId: '', // Will be set by notifier
                name: nameController.text.trim(),
                phoneNumber: phoneController.text.trim().isEmpty ? null : phoneController.text.trim(),
                relationship: relationshipController.text.trim().isEmpty ? null : relationshipController.text.trim(),
                notes: notesController.text.trim().isEmpty ? null : notesController.text.trim(),
              );

              ref.read(relapseNotifierProvider.notifier).addContact(contact);
              Navigator.pop(context);
            },
            child: const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }

  void _showEditContactDialog(RelapseContact contact) {
    final nameController = TextEditingController(text: contact.name);
    final phoneController = TextEditingController(text: contact.phoneNumber);
    final relationshipController = TextEditingController(text: contact.relationship);
    final notesController = TextEditingController(text: contact.notes);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.editContact),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name *'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: relationshipController,
                decoration: const InputDecoration(labelText: 'Relationship'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
                maxLines: 2,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a name')),
                );
                return;
              }

              contact.name = nameController.text.trim();
              contact.phoneNumber = phoneController.text.trim().isEmpty ? null : phoneController.text.trim();
              contact.relationship = relationshipController.text.trim().isEmpty ? null : relationshipController.text.trim();
              contact.notes = notesController.text.trim().isEmpty ? null : notesController.text.trim();

              ref.read(relapseNotifierProvider.notifier).updateContact(contact);
              Navigator.pop(context);
            },
            child: const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteContact(RelapseContact contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteContact),
        content: Text('Are you sure you want to delete ${contact.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(relapseNotifierProvider.notifier).deleteContact(contact.id);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.errorColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showEditCustomStepsDialog(List<String> currentSteps) {
    final controllers = currentSteps.map((step) => TextEditingController(text: step)).toList();
    
    // Add empty controller for new step
    controllers.add(TextEditingController());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Custom Steps'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controllers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(
                    labelText: 'Step ${index + 1}',
                    hintText: 'Enter step description',
                    suffixIcon: index < controllers.length - 1
                        ? IconButton(
                            icon: const Icon(Icons.delete, color: AppTheme.errorColor),
                            onPressed: () {
                              setState(() {
                                controllers.removeAt(index);
                              });
                              Navigator.pop(context);
                              _showEditCustomStepsDialog(
                                controllers.map((c) => c.text).where((t) => t.isNotEmpty).toList(),
                              );
                            },
                          )
                        : null,
                  ),
                  maxLines: 2,
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              final steps = controllers
                  .map((c) => c.text.trim())
                  .where((t) => t.isNotEmpty)
                  .toList();
              
              ref.read(relapseNotifierProvider.notifier).updateCustomSteps(steps);
              Navigator.pop(context);
            },
            child: const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }
}
