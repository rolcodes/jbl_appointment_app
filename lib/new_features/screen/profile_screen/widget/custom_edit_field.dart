import 'package:flutter/material.dart';

class CustomEditField extends StatelessWidget {
  const CustomEditField({
    super.key, required this.title, required this.subtitle, required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Icon(Icons.edit_outlined, size: 20),
              ],
            ),
          ),
          const SizedBox(
            width: 300,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
