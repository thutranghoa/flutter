import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: Text ('Hoa Trang'),
              accountEmail: Text('thutranghoa@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white,),
              ),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Dashboard'),
              leading: Icon(Icons.home),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Product Management'),
              leading: Icon(Icons.dashboard),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Order Management'),
              leading: Icon(Icons.shopping_cart),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
          )
        ],
      ),
    );
  }
}