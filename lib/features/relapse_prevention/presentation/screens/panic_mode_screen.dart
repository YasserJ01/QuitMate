import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/relapse_models.dart';
import '../providers/relapse_provider.dart';
import '../widgets/panic_step_card.dart';
import '../../../craving_toolkit/presentation/screens/breathing_exercise_screen.dart';
import '../../../craving_toolkit/presentation/screens/grounding_exercise_screen.dart';
import '../../../craving_toolkit/presentation/screens/cbt_technique_screen.dart';
import '../../../craving_toolkit/data/models/toolkit_models.dart';
import 'package:url_launcher/url_launcher.dart';

class PanicModeScreen extends ConsumerWidget {
  const PanicModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final panicStepsAsync = ref.watch(panicStepsProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.errorColor,
        foregroundColor: Colors.white,
        title: const Text(
          '🆘 Panic Mode',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: panicStepsAsync.when(
        data: (steps) {
          if (steps.isEmpty) {
            return const Center(child: Text('No panic steps configured'));
          }

          return Column(
            children: [
              // Calming header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.errorColor,
                      AppTheme.errorColor.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Take a deep breath',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You\'re going to be okay. Follow these steps:',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Panic steps
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    final step = steps[index];
                    return PanicStepCard(
                      step: step,
                      stepNumber: index + 1,
                      onActionTap: () => _handleAction(context, ref, step),
                    );
                  },
                ),
              ),

              // Helpful text at bottom
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.primaryColor.withOpacity(0.2),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Remember: This feeling is temporary. You\'ve got this!',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error loading panic steps: $error')),
      ),
    );
  }

  void _handleAction(BuildContext context, WidgetRef ref, PanicStep step) {
    switch (step.actionType) {
      case PanicActionType.breathing:
        // Navigate to breathing exercise with default pattern
        final pattern = step.actionData != null
            ? _parseBreathingPattern(step.actionData!)
            : BreathingPattern.box; // Default to box breathing

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BreathingExerciseScreen(pattern: pattern),
          ),
        );
        break;

      case PanicActionType.contact:
        // Call emergency contact
        _callEmergencyContact(context, ref, step.contactId);
        break;

      case PanicActionType.grounding:
        // Navigate to grounding exercise
        final exercise = step.actionData != null
            ? _parseGroundingExercise(step.actionData!)
            : GroundingExercise.fiveSenses; // Default to 5 senses

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroundingExerciseScreen(exercise: exercise),
          ),
        );
        break;

      case PanicActionType.custom:
        // Show custom action dialog
        _showCustomActionDialog(context, step);
        break;

      case PanicActionType.cbt:
        // Navigate to CBT technique
        final technique = step.actionData != null
            ? _parseCbtTechnique(step.actionData!)
            : CbtTechnique.urgeSurfing; // Default to urge surfing

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CbtTechniqueScreen(technique: technique),
          ),
        );
        break;
    }
  }

  BreathingPattern _parseBreathingPattern(String data) {
    switch (data.toLowerCase()) {
      case 'box':
        return BreathingPattern.box;
      case 'relaxing':
      case '478':
        return BreathingPattern.relaxing;
      case 'energizing':
        return BreathingPattern.energizing;
      case 'calm':
      case 'calming':
        return BreathingPattern.calm;
      default:
        return BreathingPattern.box;
    }
  }

  GroundingExercise _parseGroundingExercise(String data) {
    switch (data.toLowerCase()) {
      case 'fivesenses':
      case '5senses':
        return GroundingExercise.fiveSenses;
      case 'bodyscan':
      case 'bodyawareness':
        return GroundingExercise.bodyAwareness;
      case 'objectfocus':
        return GroundingExercise.objectFocus;
      case 'counting':
        return GroundingExercise.counting;
      case 'coldwater':
        return GroundingExercise.coldWater;
      default:
        return GroundingExercise.fiveSenses;
    }
  }

  CbtTechnique _parseCbtTechnique(String data) {
    switch (data.toLowerCase()) {
      case 'urgesurfing':
        return CbtTechnique.urgeSurfing;
      case 'thoughtchallenge':
        return CbtTechnique.thoughtChallenge;
      case 'consequenceanalysis':
        return CbtTechnique.consequenceAnalysis;
      case 'delaytactic':
        return CbtTechnique.delayTactic;
      case 'alternativebehavior':
        return CbtTechnique.alternativeBehavior;
      default:
        return CbtTechnique.urgeSurfing;
    }
  }

  Future<void> _callEmergencyContact(
    BuildContext context,
    WidgetRef ref,
    int? contactId,
  ) async {
    if (contactId == null) {
      // Show list of all contacts with phone numbers
      final contactsAsync = await ref.read(contactsWithPhoneProvider.future);

      if (contactsAsync.isEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No emergency contacts with phone numbers'),
            ),
          );
        }
        return;
      }

      // Show contact selection dialog
      if (context.mounted) {
        final selectedContact = await showDialog<int>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Call Emergency Contact'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: contactsAsync.map((contact) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(contact.name[0].toUpperCase()),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.formattedPhone),
                  onTap: () => Navigator.pop(context, contact.id),
                );
              }).toList(),
            ),
          ),
        );

        if (selectedContact != null) {
          final contact = contactsAsync.firstWhere(
            (c) => c.id == selectedContact,
          );
          final uri = Uri.parse('tel:${contact.phoneNumber}');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      }
    } else {
      // Call specific contact
      final contactsAsync = await ref.read(relapseContactsProvider.future);
      final contact = contactsAsync.where((c) => c.id == contactId).firstOrNull;

      if (contact != null && contact.hasPhone) {
        final uri = Uri.parse('tel:${contact.phoneNumber}');
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Contact not found or has no phone number'),
          ),
        );
      }
    }
  }

  void _showCustomActionDialog(BuildContext context, PanicStep step) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(step.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(child: Text(step.title)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(step.description),
              if (step.actionData != null && step.actionData!.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Text(
                  step.actionData!,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Great job! Keep going!'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
