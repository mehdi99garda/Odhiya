import 'package:first_flutter_app/pages/MyAccount/mes_infos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.black),
            );
          }),
          elevation: 0,
          backgroundColor: Colors.transparent,
          //toolbarHeight: 40,
          title:
              Image(image: AssetImage('images/logo_odhiya.png'), height: 100),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pushNamed('searchpage');
                }),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('MyCart');
              },
              child: Stack(
                children: [
                  IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pushNamed('MyCart');
                      }),
                  Positioned(
                      top: 0,
                      right: 6,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text('0', style: TextStyle(color: Colors.white)),
                      ))
                ],
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.green,
            indicatorWeight: 3,
            labelColor: Colors.green[300],
            tabs: [
              Tab(
                icon: Icon(Icons.person_sharp),
                text: 'Mes infos',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Settings',
              ),
              Tab(
                icon: Icon(Icons.list_alt_rounded),
                text: 'Mes annonces',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Mes favoris',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MesInfos(),
            Text('settings'),
            Text('mes annonces'),
            Text('favorites'),
          ],
        ),
      ),
    );
  }
}
