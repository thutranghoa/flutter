import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mid/widgets/product_view/product.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductForm(),
      ),
    );
  }
}

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _productNameController = TextEditingController();
  final _productImgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _productNameController,
          decoration: InputDecoration(labelText: 'Product Name'),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _productImgController,
          decoration: InputDecoration(labelText: 'Product Url'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            String productName = _productNameController.text;
            String productImg= (_productImgController.text);

            // Check if both name and price are not empty before returning
            if (productName.isNotEmpty && productImg.isNotEmpty) {
              // Return the product to the previous screen
              Navigator.pop(
                context,
                Product(name: productName, ImgUrl: productImg),
              );
            }
          },
          child: Text('Save Product'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productImgController.dispose();
    super.dispose();
  }
}