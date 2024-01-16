import 'package:flutter/material.dart';
import 'package:mid/widgets/shapes/curved_edge_widget.dart';
import 'package:mid/utils/product_container.dart';


class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdge(
      child: Container(
        color: Colors.blue,
        padding:  EdgeInsets.all(0),
        child: SizedBox(
          height: 300,
          child: Stack(
            children: [
              Positioned(top : -150, right : -250,child: ProductContain(backgroundColor: Colors.white.withOpacity(0.1))),
              Positioned(top : 100, right : -300,child: ProductContain(backgroundColor: Colors.white.withOpacity(0.1))),
            ],
          ),
        ),
      ),
    );
  }
}