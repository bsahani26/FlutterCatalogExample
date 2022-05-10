import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalogItem;
  AddToCart({
    Key? key,
    required this.catalogItem,
  }) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalogItem);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = !isInCart;
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(catalogItem);
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).buttonColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
