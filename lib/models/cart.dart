import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  // Catalog field
  late CatalogModel _catalogModel;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get catalog
  CatalogModel get catalogModel => _catalogModel;

  set catalog(CatalogModel newCatalog) {
    _catalogModel = newCatalog;
  }

// Get items in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).toList();

  // Get total price

  num get totalPrice => items.fold(
      0, (totalPriceValue, currentItem) => totalPriceValue + currentItem.price);

  //Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
