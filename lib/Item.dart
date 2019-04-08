import 'package:date_format/date_format.dart';

class Item {
  final String name;
  final String imageUrl;
  final int quantity;
  final String unit;
  final String storedIn;
  final String tags;
  final String expiryDate;
  final bool isWasted;

  Item({this.name, this.imageUrl, this.quantity, this.unit, this.storedIn, this.tags, this.expiryDate, this.isWasted});

  factory Item.fromJson(Map<String, dynamic> js) {
    if (js == null)
      return null;
    return Item(
      name: js['name'],
      imageUrl: js['imageUrl'],
      quantity: int.parse(js['quantity']),
      unit: js['unit'],
      storedIn: js['storedIn'],
      tags: js['tags'],
      expiryDate: formatDate(DateTime.parse(js['expiryDate'] as String), [mm, '/', dd, '/', yyyy]),
      isWasted: js['isWasted']
    );
  }

  static Item parseItem(Map<String, dynamic> jsonItem) {
    Item item = Item.fromJson(jsonItem);
    return item;
  }
}
