import 'package:cupertion_app_demo/model/app_state_model.dart';
import 'package:cupertion_app_demo/product_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Consumer<AppStateModel>(
      builder: (context, model, child) {
        final products = model.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Store'),
            ),
            SliverSafeArea(
              top: false,
              bottom: true,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < products.length) {
                    return ProductRowItem(
                      product: products[index],
                      lastItem: index == products.length - 1,
                    );
                  }
                  //Note: return null for List.builder if end list
                  return null;
                }),
              ),
            )
          ],
        );
      },
    ));
  }
}
