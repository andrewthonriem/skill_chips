import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String skill;
  final VoidCallback onDelete;

  const SkillChip({super.key, required this.skill, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      deleteIcon: const Icon(Icons.close),
      deleteButtonTooltipMessage: 'Delete $skill',
      onDeleted: onDelete,
    );
  }
}
