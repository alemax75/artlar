import 'package:artlar/screen/home/components/categories.dart';
import 'package:artlar/screen/home/components/recommond_products.dart';
import 'package:artlar/screen/title_text.dart';
import 'package:artlar/service/service.dart';

import 'package:artlar/size_config.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final firestoreService = FirestoreService();
    double defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(
                title: "Browse by Categories",
              ),
            ),
            StreamBuilder(
              stream: firestoreService.getCategory(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data)
                  : Center(child: Image.asset("lib/assets/ripple.gif")),
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(title: "Recommands For You"),
            ),
            // Right Now product is our demo product
            StreamBuilder(
              stream: firestoreService.getProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(products: snapshot.data)
                    : Center(child: Image.asset('lib/assets/ripple.gif'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
