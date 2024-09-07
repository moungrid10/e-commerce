

import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/data/banners/bammer_repository.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

class BannersController extends GetxController {
  static BannersController get instance => Get.find();

  final isLoading = false.obs;
  final carousalControllerIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  
  @override
  void onInit() {
    fetchCBanners();
    super.onInit();
    
  }

  void updatePageIndicator(index){
    carousalControllerIndex.value= index;
  }

   Future<void> fetchCBanners() async {
    try{
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      
      this.banners.assignAll(banners);


    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message:  e.toString());

    } finally{
      isLoading.value= false;

    }
  }
}
