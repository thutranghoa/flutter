import 'package:flutter/material.dart';
import 'package:mid/components/my_drawer.dart';
import 'package:mid/widgets/container/rounded_container.dart';
import 'package:mid/widgets/container/search_container.dart';
import 'package:mid/widgets/product_view/form_add_product.dart';
import 'package:mid/widgets/product_view/form_edit_product.dart';
import 'package:mid/widgets/product_view/product.dart';
import 'package:mid/widgets/product_view/tabBar.dart';
import 'package:contacts_service/contacts_service.dart';

import '../carouse/banner_slider.dart';

// --------------- 5:50 video 18-----------
class ProductView extends StatefulWidget {
  ProductView({super.key});
  // static List<String> sports_name = ['Sport 0', 'Sport 1','Sport 3','Sport 04'];
  // static List sport_url = ['assets/images/product1.png','assets/images/product1.png','assets/images/product1.png','assets/images/product1.png'];
  // static List<double> sport_price = [10.0, 11.0,12.2,13.2];

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  List<Product> sports = [
    Product(name: 'Sport 1', ImgUrl: 'assets/images/product3.png'),
    Product(name: 'Sport 2', ImgUrl: 'assets/images/product1.png'),
    Product(name: 'Sport 3', ImgUrl: 'assets/images/product2.png'),
  ];

  List<Product> man = [
    Product(name: 'Men 1', ImgUrl: 'assets/images/men1.png'),
    Product(name: 'Men 2', ImgUrl: 'assets/images/men2.png'),
    Product(name: 'Men 3', ImgUrl: 'assets/images/men3.png'),
    Product(name: 'Men 4', ImgUrl: 'assets/images/men4.png'),
  ];

  List<Product> women = [
    Product(name: 'Women 1', ImgUrl: 'assets/images/woman1.png'),
    Product(name: 'Women 2', ImgUrl: 'assets/images/woman2.png'),
    Product(name: 'Women 3', ImgUrl: 'assets/images/woman3.png'),
    Product(name: 'Women 4', ImgUrl: 'assets/images/woman4.png'),
    Product(name: 'Women 5', ImgUrl: 'assets/images/woman5.png'),
  ];

  List<Product> new_arr = [
    Product(name: 'New 1', ImgUrl: 'assets/images/new1.png'),
    Product(name: 'New 2', ImgUrl: 'assets/images/new2.png'),
    Product(name: 'New 3', ImgUrl: 'assets/images/new3.png'),
    Product(name: 'New 4', ImgUrl: 'assets/images/new4.png'),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink.shade300,
          title: Text('Product View', style: TextStyle(color: Colors.white),),
        ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async{
        //     final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProductPage()));
        //     if(result != null){
        //       setState(() {
        //         sports.add(result);
        //       });
        //     }
        //   },
        //   child: Icon(Icons.add),
        //   // backgroundColor: Theme.of(context).primaryColorDark,
        // ),


        drawer: MyDrawer(),

        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: Colors.white,
              expandedHeight: 380,

              flexibleSpace: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 16),
                    SearchContainer(text: '', showBorder: true),
                    SizedBox(height: 16),
                    Banner_slider()

                  ],
                ),
              ),
                // ----------------------------TABBAR-------------------------------
              bottom: MyTabbar(
                  tabs: [
                    Tab(child: Text('Sports', style: TextStyle(fontSize: 18))),
                    Tab(child: Text('Man', style: TextStyle(fontSize: 18))),
                    Tab(child: Text('Woman', style: TextStyle(fontSize: 18))),
                    Tab(child: Text('New arrival', style: TextStyle(fontSize: 18))),
                  ]
              ),
            )
          ];
        },
          //
            body: TabBarView(
              children: [
                sports.isEmpty
                ? Center(child: Text('Your product list is empty'))
                :
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: sports.length,
                        itemBuilder: (context, index){
                          return Container(
                              child: SizedBox(
                                height: 100,
                                child: Center(
                                  child: ListTile(
                                    title: Text(sports[index].name),
                                    leading: SizedBox(
                                      child: Image.asset(sports[index].ImgUrl, fit: BoxFit.fill,),
                                    ),
                                    trailing: SizedBox(
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              final updatedProduct = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProductPage(product: sports[index])));
                                              if (updatedProduct != null) {
                                                setState(() {
                                                  sports[index] = updatedProduct;
                                                });
                                              }
                                            },
                                            child: Icon(Icons.edit),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                sports.removeAt(index);
                                              });
                                            },
                                            child: Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // elevation: 5,
                              // margin: EdgeInsets.all(10),
                            );
                        },
                      ),
                    ),
                    ElevatedButton.icon (
                      onPressed: () async {
                        final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProductPage()));
                        if (result != null){
                          setState(() {
                            sports.add(result);
                          });
                        }
                      },
                      label: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: Icon(Icons.add, color: Colors.white,),
                    ),
                  ],
                ),


                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: man.length,
                        itemBuilder: (context, index){
                          return Container(
                            child: SizedBox(
                              height: 100,
                              child: Center(
                                child: ListTile(
                                  title: Text(man[index].name),
                                  leading: SizedBox(
                                    child: Image.asset(man[index].ImgUrl, fit: BoxFit.fill,),
                                  ),
                                  trailing: SizedBox(
                                    width: 70,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final updatedProduct = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProductPage(product: man[index])));
                                            if (updatedProduct != null) {
                                              setState(() {
                                                man[index] = updatedProduct;
                                              });
                                            }
                                          },
                                          child: Icon(Icons.edit),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              man.removeAt(index);
                                            });
                                          },
                                          child: Icon(Icons.delete),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // elevation: 5,
                            // margin: EdgeInsets.all(10),
                          );
                        },
                      ),
                    ),
                    ElevatedButton.icon (
                      onPressed: () async {
                        final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProductPage()));
                        if (result != null){
                          setState(() {
                            man.add(result);
                          });
                        }
                      },
                      label: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: Icon(Icons.add, color: Colors.white,),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: women.length,
                        itemBuilder: (context, index){
                          return Container(
                            child: SizedBox(
                              height: 100,
                              child: Center(
                                child: ListTile(
                                  title: Text(women[index].name),
                                  leading: SizedBox(
                                    child: Image.asset(women[index].ImgUrl, fit: BoxFit.fill,),
                                  ),
                                  trailing: SizedBox(
                                    width: 70,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final updatedProduct = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProductPage(product: women[index])));
                                            if (updatedProduct != null) {
                                              setState(() {
                                                women[index] = updatedProduct;
                                              });
                                            }
                                          },
                                          child: Icon(Icons.edit),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              women.removeAt(index);
                                            });
                                          },
                                          child: Icon(Icons.delete),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // elevation: 5,
                            // margin: EdgeInsets.all(10),
                          );
                        },
                      ),
                    ),

                    ElevatedButton.icon (
                      onPressed: () async {
                        final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProductPage()));
                        if (result != null){
                          setState(() {
                            women.add(result);
                          });
                        }
                      },
                      label: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: Icon(Icons.add, color: Colors.white,),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: new_arr.length,
                        itemBuilder: (context, index){
                          return Container(
                            child: SizedBox(
                              height: 100,
                              child: Center(
                                child: ListTile(
                                  title: Text(new_arr[index].name),
                                  leading: SizedBox(
                                    child: Image.asset(new_arr[index].ImgUrl, fit: BoxFit.fill,),
                                  ),
                                  trailing: SizedBox(
                                    width: 70,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final updatedProduct = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProductPage(product: new_arr[index])));
                                            if (updatedProduct != null) {
                                              setState(() {
                                                new_arr[index] = updatedProduct;
                                              });
                                            }
                                          },
                                          child: Icon(Icons.edit),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              new_arr.removeAt(index);
                                            });
                                          },
                                          child: Icon(Icons.delete),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // elevation: 5,
                            // margin: EdgeInsets.all(10),
                          );
                        },
                      ),
                    ),
                    ElevatedButton.icon (
                      onPressed: () async {
                        final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProductPage()));
                        if (result != null){
                          setState(() {
                            new_arr.add(result);
                          });
                        }
                      },
                      label: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: Icon(Icons.add, color: Colors.white,),
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}








// Padding(
// padding: EdgeInsets.symmetric(horizontal: 24),
// child: Container(
// padding: EdgeInsets.all(16),
// decoration: BoxDecoration(
// color: Colors.transparent,
// borderRadius: BorderRadius.circular(16),
// border : Border.all(color: Colors.red)
// ),
// ),
// )


// body: SingleChildScrollView(
// child: Column(
// children: [
// ProductAppBar(
//   child: Column(
//   children: [
//     MyAppBar(title: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Product Management", style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.red),)
//       ],
//     ),),
//
//
//
//   ],),),

// Padding(
// padding: EdgeInsets.all(24),
// child: Container(
// width: DeviceUtils.getScreenWidth(context),
// padding: EdgeInsets.all(16),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(16),
// border : Border.all(color: Colors.grey)
// ),
//
// child: Row(
// children: [
// Icon(Iconsax.search_normal, color : Colors.black),
// const SizedBox(width: 16),
// Text('Search here ... ', style: Theme.of(context).textTheme.bodyLarge,)
// ],
// ),
// ),
// )
//
//
//
// ],
// ),
// ),