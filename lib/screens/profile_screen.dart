import 'package:flutter/material.dart';

import '../widgets/skill_chip.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final skillController = TextEditingController();
  final List<String> skills = [];

  void addSkill() {
    final skill = skillController.text.trim();
    if (skill.isEmpty ||
        skills.any(
          (existingSkill) => existingSkill.toLowerCase() == skill.toLowerCase(),
        )) {
      return;
    }

    setState(() => skills.add(skill));
    skillController.clear();
  }

  void removeSkill(String skill) {
    setState(() => skills.remove(skill));
  }

  @override
  void dispose() {
    skillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Chips')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: skillController,
              onSubmitted: (_) => addSkill(),
              decoration: InputDecoration(
                labelText: 'Add a skill',
                border: const OutlineInputBorder(),
                suffixIcon: Tooltip(
                  message: 'Add skill',
                  triggerMode: TooltipTriggerMode.longPress,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: addSkill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: skills.isEmpty
                  ? const Text('Add a skill above to see its chip here.')
                  : SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: skills
                            .map(
                              (skill) => SkillChip(
                                skill: skill,
                                onDelete: () => removeSkill(skill),
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
