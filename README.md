# Skill Chips App
A Chip is a small rounded box that shows short information. It is often used like a tag or to display skills. For example, LinkedIn uses skills to show what a person can do.

## What my app does

In my app, the user can type a skill and press Enter or the + button to add it. The skill appears as a chip on the screen. The user can tap the ✕ icon to remove a skill. The app does not allow duplicate skills.

## How to run

1. Clone the repo:
   git clone https://github.com/andrewthonriem/skill_chips.git

2. Open the folder:
   cd skill_chips

3. Get packages:
   flutter pub get

4. Run the app:
   flutter run -d chrome

## The three properties

### 1. deleteIcon

This property changes the icon of the delete button. I used Icons.close, which displays an ✕ icon. Changing it to Icons.delete shows a trash bin icon instead.

### 2. deleteButtonTooltipMessage

This shows a message when the user hovers over the delete button. In my app, the message says "Delete" followed by the skill name.

### 3. onDeleted

This runs when the user taps the ✕ button. It removes the skill from the list. Without this property, there is no delete button on the Chip.

## Screenshot

![alt text](<Screenshot 2026-11-04 011837.png>)

## Sources

I used the Flutter Chip documentation:
https://api.flutter.dev/flutter/material/Chip-class.html
