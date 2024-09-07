import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/data/categories/category_repository.dart';
import 'package:e_commerce/data/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryrepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
     fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try{
      isLoading.value = true;

      final categories = await _categoryrepository.getAllCategories();
        allCategories.assignAll(categories);


        featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());





    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message:  e.toString());

    } finally{
      isLoading.value= false;

    }
  }


  Future<List<CategoryModel>> getSubCategories(String categoryId)async {
    try{
      final subCategories = await _categoryrepository.getSubCategories(categoryId);

      return subCategories;


    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message:  e.toString());
      return [];
    } 
  }

  
  Future<List<ProductModel>> getCategoryProducts({required String categoryId , int limit = 4})async {
    try{
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);


      return products;


    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message:  e.toString());
      return [];
    } 
  }

 
   



}