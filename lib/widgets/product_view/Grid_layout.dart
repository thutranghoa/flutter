
import 'package:flutter/material.dart';
import 'package:mid/widgets/product_view/product_card_vertical.dart';

class Grid_layout extends StatelessWidget {
  const Grid_layout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double ? mainAxisExtent;
  final Widget ? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: mainAxisExtent
        ),
        itemBuilder: itemBuilder,
    );
  }
}
