import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = 'View all',
    required this.title,
    this.showActionbutton = true,
  });

  final Color ? textColor;
  final bool showActionbutton;
  final String title,buttonTitle;
  final void Function() ? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,),
        if(showActionbutton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
