
import 'package:flutter/material.dart';
import 'package:mid/widgets/container/product_app_bar.dart';
import 'package:mid/widgets/container/appbar.dart';
import 'package:mid/components/my_drawer.dart';
import 'package:mid/utils/devices.dart';
import 'package:mid/widgets/container/search_container.dart';

// --------------- 5:50 video 18-----------
class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink.shade300,
          title: Text('Product View', style: TextStyle(color: Colors.white),),
        ),
      
        drawer: MyDrawer(),
      
        body: NestedScrollView (headerSliverBuilder: (_, innerBoxIsScrolled){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: Colors.white,
              expandedHeight: 140,
              
              flexibleSpace: Padding(
                padding: EdgeInsets.all(0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    SizedBox(height: 16),
                    SearchContainer(text: '', showBorder: true),
                    SizedBox(height: 16),
      
                  ],
                ),
              ),
      
              bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.purple,
                  unselectedLabelColor: Colors.red,
                  tabs: [
                    Tab (child: Text('Sprorts', style: TextStyle(fontSize: 18))),
                    Tab (child: Text('Man', style: TextStyle(fontSize: 18))),
                    Tab (child: Text('Woman', style: TextStyle(fontSize: 18))),
                    Tab (child: Text('Kid', style: TextStyle(fontSize: 18))),
                    Tab (child: Text('Hot', style: TextStyle(fontSize: 18))),
                    Tab (child: Text('New arrival', style: TextStyle(fontSize: 18))),
                    Tab (child: Text('Fashion', style: TextStyle(fontSize: 18))),
      
                  ]
              ),
            )
          ];
        },
          body: Container(
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