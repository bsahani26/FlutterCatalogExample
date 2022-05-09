// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: CatalogTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CatalogTheme.darkBluishColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Buy".text.make())
                .wh(100, 50)
                .px16()
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).h32(context)),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(CatalogTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl
                        .textStyle(const TextStyle(color: Colors.grey))
                        .make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ))
          ])),
    );
  }
}
