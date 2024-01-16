import 'package:flutter/material.dart';
import 'package:mid/utils/devices.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground= true,
    this.showBorder = true,
    this.onTap,

  });

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
            width: DeviceUtils.getScreenWidth(context),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border : Border.all(color: Colors.grey)
            ),

            child: Row(
              children: [
                Icon(Iconsax.search_normal, color : Colors.black),
                const SizedBox(width: 16),
                Text('Search here ... ', style: Theme.of(context).textTheme.bodyLarge,)
              ],
            )
        ),

      ),
    );
  }
}
