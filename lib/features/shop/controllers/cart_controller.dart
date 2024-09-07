import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/features/shop/controllers/variation_controller.dart';
import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/local_storage/storage.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
static CartController get instance => Get.find();
// Variables
RxInt noOfCartItems = 0.obs;
RxDouble totalCartPrice = 0.0.obs;
RxInt productQuantityInCart = 0.obs;
RxList<CartItemModel> cartItems = <CartItemModel>[].obs; 
final variationController = VariationController.instance;

CartController(){
  loadCartItems();
}
// Add items in the cart
void addToCart (ProductModel product) {
// Quantity Check
if (productQuantityInCart.value < 1) {
TLoaders.customToast (message: 'Select Quantity');
return;
}
// Variation Selected?
if (product.productType == ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty){ 
  TLoaders.customToast (message: 'Select Variation');
  return;
}

// Out of Stock Status
if (product.productType == ProductType.variable.toString()) {
if (variationController.selectedVariation.value.stock < 1) {
TLoaders.warningSnackBar (message: 'Selected variation is out of stock.', title: 'Oh Snap!');
return;
}
} else {
  if (product.stock < 1){

    TLoaders.warningSnackBar (message: 'Selected product is out of stock.', title: 'Oh Snap!');

  }
}
final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

int index = cartItems.
indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);
if(index >= 0){
cartItems[index].quantity= selectedCartItem.quantity;
}else{
  cartItems.add(selectedCartItem);
}

updateCart();
TLoaders.customToast (message: 'Your Product has been added to the Cart.');
}

void updateCart() {
updateCartTotals();
saveCartItems(); 
cartItems.refresh();

}

CartItemModel convertToCartItem(ProductModel product, int quantity) {
   if (product.productType == ProductType.single.toString()) {

// Reset Variation in case of single product type.
variationController.resetSelectedAttributes();
}
final variation = variationController.selectedVariation.value;
final isVariation = variation.id.isNotEmpty;
final price = isVariation
? variation.salePrice > 0.0
? variation.salePrice
: variation.price
: product.salePrice! > 0.0
? product.salePrice : product.price;
return CartItemModel( productId: product.id,
title: product.title, 
price: price!,
quantity: quantity,
variationId: variation.id,
image: isVariation? variation.image :product.thumbnail,
brandName: product.brand != null ? product.brand!.name : '',
selectedVariation: isVariation? variation.attributeValues: null,);
}

void updateCartTotals() {
double calculatedTotalPrice = 0.0; 
int calculatedNoOfItems = 0;
for (var item in cartItems) {
calculatedTotalPrice += (item.price) * item.quantity.toDouble(); 
calculatedNoOfItems += item.quantity;
}
totalCartPrice.value = calculatedTotalPrice;
noOfCartItems.value = calculatedNoOfItems;
}
void saveCartItems() {
final cartItemStrings = cartItems.map((item) => item.toJson()).toList(); 
TLocalStorage.instance().writeData('cartItems', cartItemStrings);
}
void loadCartItems() {
final cartItemStrings = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
if (cartItemStrings != null) {
cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
updateCartTotals();
}
}



int getProductQuantityInCart(String productId) {

final foundItem =
cartItems.where((item) => item.productId == productId).fold (0, (previousValue, element) => previousValue + element.quantity); 
return foundItem;
}
int getVariationQuantityInCart(String productId, String variationId) {
final foundItem = cartItems.firstWhere(

(item) => item.productId == productId && item.variationId == variationId,
orElse: () => CartItemModel.empty(),);
return foundItem.quantity;
}
void clearCart(){
productQuantityInCart.value = 0;
cartItems.clear();
updateCart();
}


void addOneToCart (CartItemModel item) {
int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
if (index >= 0) {
cartItems[index].quantity += 1;
} else {
  cartItems.add(item);
}
updateCart();
}


void removeOneFromCart (CartItemModel item) {
int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item. variationId);
if (index >= 0) {
if (cartItems[index].quantity> 1) {
cartItems[index].quantity -= 1;
} else {
// Show dialog before completely removing
cartItems[index].quantity == 1 ? removeFromCartDialog(index): cartItems.removeAt(index);
}
updateCart();
}
}

void removeFromCartDialog(int index) {
Get.defaultDialog(

title: 'Remove Product',
middleText: 'Are you sure you want to remove this product?', 
onConfirm: (){
// Remove the item from the cart
cartItems.removeAt(index);
updateCart();
TLoaders.customToast (message: 'Product removed from the Cart.');
Get.back();

},
onCancel: () => () => Get.back(),
);
}

void updateAlredyAddedProductCount (ProductModel product){

  if(product.productType == ProductType.single.toString()){
    productQuantityInCart.value =getProductQuantityInCart(product.id);

  } else {

    final variationId = variationController.selectedVariation.value.id;
    if (variationId.isNotEmpty){
      productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);

    } else {
      productQuantityInCart.value=0;
    }
  }
  
}



}