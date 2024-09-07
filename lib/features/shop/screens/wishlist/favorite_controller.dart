import 'dart:convert';

import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/data/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/local_storage/storage.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{

  static FavoriteController get instance => Get.find();

  

  final favorites = <String, bool>{}.obs;
@override
void onInit() {

super.onInit();
initFavorites();
}
// Method to initialize favorites by reading from storage
void initFavorites() {
final json = TLocalStorage.instance().readData('favorites');
if (json != null) {

final storedFavorites = jsonDecode (json) as Map<String, dynamic>;
favorites.assignAll (storedFavorites.map((key, value) => MapEntry (key, value as bool)));
}
}
bool isFavourite (String productId) {

return favorites [productId] ?? false;
}
void toggleFavoriteProduct(String productId) {
if(!favorites.containsKey(productId)){
favorites [productId] = true;
saveFavoritesToStorage();
TLoaders.customToast (message: 'Product has been added to the Wishlist.');
} else {

TLocalStorage.instance().removeData(productId);
favorites.remove(productId);
saveFavoritesToStorage();
favorites.refresh();

TLoaders.customToast (message: 'Product has been removed from the Wishlist.');
}
  

}

void saveFavoritesToStorage(){
  final encodedFavorites = json.encode(favorites);
  TLocalStorage.instance().saveData('favorites', encodedFavorites);}

Future<List<ProductModel>> FavoriteProducts() async {
  return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
}



}
