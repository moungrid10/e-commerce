import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/images_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  // Variables
  RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Select Attribute and Update Variation
  void onAttributeSelected(ProductModel product, String attributeName, dynamic attributeValue) {
    selectedAttributes[attributeName] = attributeValue;

    // Find the matching variation based on selected attributes
    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Update selected product image if the variation has one
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    if(selectedVariation.id.isNotEmpty){
      final cartcontroller = CartController.instance;
      cartcontroller.productQuantityInCart.value = cartcontroller.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    this.selectedVariation.value = selectedVariation;

    // Update stock status
    getProductVariationStockStatus();
  }

  /// Check if variation attributes match the selected attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check Attribute availability / Stock in Variation
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations.where(
      (variation) =>
          variation.attributeValues[attributeName] != null &&
          variation.attributeValues[attributeName]!.isNotEmpty &&
          variation.stock > 0,
    ).map((variation) => variation.attributeValues[attributeName])
     .toSet();

    return availableVariationAttributeValues;
  }

  /// Update stock status based on the selected variation
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset selected attributes and variation status
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
