import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mid/widgets/product_view/product.dart';

class FormEditProduct extends StatefulWidget {
  FormEditProduct({
    super.key,
    this.cate,
  });

  final List<Product> cate;

  @override
  State<FormEditProduct> createState() => _FormEditProductState();
}

class _FormEditProductState extends State<FormEditProduct> {
  final nameController = TextEditingController();
  final urlController = TextEditingController();

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit product'),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
              TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                Radius.circular(10),
              ))),),
            const SizedBox(height: 20),
            // TextField(
            //   controller: nameController,
            //   decoration: const InputDecoration(
            //       labelText: 'Price',
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(10),
            //           ))),
            // ),
            // const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ElevatedButton(
                //     onPressed: (){
                //       String name = nameController.text.trim();
                //       String url = urlController.text.trim();
                //       if (name.isNotEmpty && url.isNotEmpty){
                //         setState(() {
                //           nameController.text = '';
                //           urlController.text = '';
                //           cate.add(Product(name: name, ImgUrl: url));
                //         });
                //       }
                //     },
                //     child: Text('Save')),
                ElevatedButton(
                    onPressed: (){
                      String name = nameController.text.trim();
                      String url = urlController.text.trim();
                      if (name.isNotEmpty && url.isNotEmpty){
                        setState(() {
                          nameController.text = '';
                          urlController.text = '';

                          cate[selectedIndex].name = name;
                          cate[selectedIndex].ImgUrl = url;
                          selectedIndex = -1 ;
                        });
                      }
                    },
                    child: Text('Save')),
              ],
            ),
            // cate.isEmpty
            // ? Text (
            //   'No product ...',style: TextStyle(fontSize: 22),
            // )
            //     : Expanded(
            //     child: ListView.builder(
            //         itemBuilder: (context, index) => getRow(index),
            //     )
            // )

          ],
        ),
      ),
    );
  }
}
