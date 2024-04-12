import 'package:app_project2/komponen/bottom_nav_bar.dart';
import 'package:app_project2/pages/about_page.dart';
import 'package:app_project2/pages/api_task.dart';
import 'package:app_project2/pages/cart_page.dart';
import 'package:app_project2/pages/page_awal.dart';
import 'package:app_project2/pages/profil_page.dart';
import 'package:app_project2/pages/shop_page.dart';
import 'package:app_project2/pages/sql_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  //index yang dipilih untuk mengontrol bottom nav bar
  int _selectedIndex = 0;

//metod untuk update dan memilih index
//ketika user menekan bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //halaman untuk display
  final List<Widget> _pages = [
    //Home Page
    const ShopPage(),

    //cart page
    const CartPage(),

    //setting page
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 137, 109),
      bottomNavigationBar: MyBottomNavBar(
        onTap: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ));
        }),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('I Made Satria Ananda Wibawa'),
            accountEmail: Text('satria101@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/selfPic.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('profil'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfilPage(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('about'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutPage(),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Latihan API'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ApiTask(),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Latihan CRUD SQLITE'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SqlTask(),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const PageAwal(),
                ),
              ),
            ),
          ),
        ],
      )),
      body: _pages[_selectedIndex],
    );
  }
}
