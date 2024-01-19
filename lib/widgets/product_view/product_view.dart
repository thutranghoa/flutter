import 'package:flutter/material.dart';

import 'package:mid/components/my_drawer.dart';
import 'package:mid/widgets/container/rounded_container.dart';
import 'package:mid/widgets/container/search_container.dart';
import 'package:mid/widgets/product_view/Category_tab.dart';
import 'package:mid/widgets/product_view/product.dart';
import 'package:mid/widgets/product_view/tabBar.dart';


import '../carouse/banner_slider.dart';

// --------------- 5:50 video 18-----------
class ProductView extends StatelessWidget {
  ProductView({super.key});
  static List<String> sports_name = ['Sport 0', 'Sport 1','Sport 3','Sport 04'];
  static List sport_url = ['assets/images/product1.png','assets/images/product1.png','assets/images/product1.png','assets/images/product1.png'];
  static List<double> sport_price = [10.0, 11.0,12.2,13.2];
  final List<Product> sports = List.generate(sports_name.length,
          (index) => Product(name: '${sports_name[index]}', price: sport_price[index], ImgUrl: '${sport_url[index]}')
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink.shade300,
          title: Text('Product View', style: TextStyle(color: Colors.white),),
        ),

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
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: sports_name.length,
                  itemBuilder: (context, index){
                    return Card(
                        child: SizedBox(
                          height: 100,
                          child: Center(
                            child: ListTile(
                              title: Text(sports[index].name),
                              leading: SizedBox(
                                child: Image.asset(sports[index].ImgUrl, fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                        ),
                        elevation: 5,
                        // margin: EdgeInsets.all(10),
                      );

                  },
                ),
                ListView.separated(
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){},
                      title: Text('Man $index'),
                    );
                  },
                  separatorBuilder: (BuildContext contex, int index) => const Divider(),
                  itemCount: 2,
                  padding: EdgeInsets.all(15),
                ),
                ListView.separated(
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){},
                      title: Text('Woman $index'),
                    );
                  },
                  separatorBuilder: (BuildContext contex, int index) => const Divider(),
                  itemCount: 3,
                  padding: EdgeInsets.all(15),
                ),
                ListView.separated(
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){},
                      title: Text('New $index'),
                    );
                  },
                  separatorBuilder: (BuildContext contex, int index) => const Divider(),
                  itemCount: 1,
                  padding: EdgeInsets.all(15),
                )
              ],
            )


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