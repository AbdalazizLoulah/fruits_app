
import 'package:fruits_app/feature/favorite/data/model/favorite_product_model.dart';

class FavoriteItem {
  final int id;
  final int favoId;
  final int priceWithDiscount;
  final Product product;

  FavoriteItem({
    required this.id,
    required this.favoId,
    required this.priceWithDiscount,
    required this.product,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      id: json['id'],
      favoId: json['favo_id'],
      priceWithDiscount: json['price_with_discount'] ?? 0,
      product: Product.fromJson(json['product']),
    );
  }
}
