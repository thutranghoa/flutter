import 'package:flutter/material.dart';
import 'package:mid/widgets/product_view/Grid_layout.dart';
import 'package:mid/widgets/product_view/product_card_vertical.dart';
import 'package:mid/widgets/product_view/section_head.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              // SectionHeading(title: '', onPressed: (){},),
              SizedBox(height: 16),
              Grid_layout(itemCount: 4, itemBuilder: (_,index) => ProductCardVertical()),
              SizedBox(height: 32)
            ],
          ),
        ),
      ]
    );
  }
}
