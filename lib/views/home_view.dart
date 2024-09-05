import 'package:flutter/material.dart';
import 'package:idea_box_app/views/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          CustomButton(iconData: Icons.search, onTap: () {}),
          const SizedBox(
            width: 16,
          ),
          CustomButton(iconData: Icons.priority_high_rounded, onTap: () {}),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
