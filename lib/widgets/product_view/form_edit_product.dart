import 'package:flutter/material.dart';
import 'package:mid/widgets/product_view/product.dart';

class EditProductPage extends StatefulWidget {
  final Product product;

  EditProductPage({required this.product});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController nameController;
  late TextEditingController urlController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing product data
    nameController = TextEditingController(text: widget.product.name);
    urlController = TextEditingController(text: widget.product.ImgUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: urlController,
              decoration: InputDecoration(labelText: 'Img URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the product data and pop the current page
                final updatedProduct = Product(
                  name: nameController.text,
                  ImgUrl: urlController.text,
                );

                // Return the updated product to the previous page
                Navigator.pop(context, updatedProduct);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}