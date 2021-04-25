import 'package:cupertion_app_demo/cart.dart';
import 'package:cupertion_app_demo/product.dart';
import 'package:cupertion_app_demo/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //For device only portrait
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      //TODO: for keyboard
      resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Product'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart), label: 'Cart'),
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return ProductListTab();
            case 1:
              return SearchListTab();
            case 2:
              return CartTab();
          }
          return ProductListTab();
        });
  }
}
