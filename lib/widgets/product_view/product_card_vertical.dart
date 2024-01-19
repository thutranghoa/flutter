import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mid/widgets/carouse/rounded_image.dart';
import 'package:mid/widgets/container/rounded_container.dart';
import 'package:mid/widgets/product_view/price_text.dart';
import 'package:mid/widgets/product_view/product_title.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white
      ),
      child: Column(
        children: [
          RoundedContainer(
            height: 180,
            padding: EdgeInsets.all(14),
            backgroundColor: Colors.white,
            child: Stack(
              children: [
                Image_rounded(imgURl: 'assets/images/product1.png', applyImageRadius: true,),
                RoundedContainer(
                  radius: 16,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitle(title: 'Nike Air Force 107', smallSize: true,),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Nike',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(width: 8,),
                    Icon(Iconsax.verify5, color: Colors.blueAccent,size: 20,)

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    PriceText(price: '35.0', isLarge: true,),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(16)
                        )
                      ),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(Iconsax.add, color: Colors.white,),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
