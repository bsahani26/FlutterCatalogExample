import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
