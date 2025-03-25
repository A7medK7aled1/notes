import 'package:flutter/material.dart';
import 'package:notes/views/home/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Notes',
          style: TextStyle(
            fontSize: 43,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito',
          ),
        ),
        Row(
          children: const [
            CustomIconButton(icon: Icons.search),
            SizedBox(width: 21),
            CustomIconButton(icon: Icons.info_outline),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
