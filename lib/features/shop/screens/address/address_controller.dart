import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/common/widgets/network_manager.dart';
import 'package:e_commerce/common/widgets/single_address.dart';
import 'package:e_commerce/features/shop/models/address_model.dart';
import 'package:e_commerce/features/shop/screens/address/NewAddress.dart';
import 'package:e_commerce/features/shop/screens/address/adress_repository.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();


  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;



  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AdressRepository());

  Future<List<AddressModel>> getallUserAddresses() async{

    try{
      final addresses = await addressRepository.fetchUserAddresses(); 
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;

    } catch(e){
      TLoaders.errorSnackBar(title: 'Address not found', message:  e.toString());
      return [];
    }
  }


  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);

      }

      newSelectedAddress.selectedAddress = true;

      selectedAddress.value = newSelectedAddress;

      await addressRepository.updateSelectedField(selectedAddress.value.id, true);


    } catch(e){
        TLoaders.errorSnackBar(title: 'Error in selection', message:  e.toString());

    }
  }

  Future addNewAddressea() async{
    try{
      FullScreenLoader.openLoadingDialog("Storing Address...", "assets/images/store/nike.png");


      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){

        FullScreenLoader.stopLoading();
        return;
      }


      if(!addressFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
       
        return;
      }

      final address = AddressModel(
        id: '', 
        name: name.text.trim(), 
        phoneNumber: phoneNumber.text.trim(), 
        street: street.text.trim(), 
        city: city.text.trim(),  
        state: state.text.trim(), 
        postalCode: postalCode.text.trim(), 
        country: country.text.trim(),
        selectedAddress: true );
        final id = await addressRepository.addAddress(address);

        address.id = id;
        await selectAddress(address);

        FullScreenLoader.stopLoading();

        TLoaders.successSnackBar(title: 'Congratulatiom', message: 'Your adreess has been saved');

        refreshData.toggle();

        resetFormField();

        Navigator.of(Get.context!).pop();
  

    } catch(e){
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Adreess not Found',message: e.toString());
      
    }

  }

  void resetFormField(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup (BuildContext context) { 
    return showModalBottomSheet(
context: context,
builder: (_) => Container(
padding: const EdgeInsets.all(TSizes.lg),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

TSectionHeading (title: 'Select Address', showActionButton: false),
FutureBuilder(
future: getallUserAddresses(),
builder: (_, snapshot) {


return ListView.builder(
shrinkWrap: true,
itemCount: snapshot.data!.length,
itemBuilder: (_, index) => SingleAddress(
address: snapshot.data![index],
onTap:() async {

await selectAddress(snapshot.data! [index]); 
Get.back();
},
), 
); 
}// ListView.builder
), // FutureBuilder
const SizedBox (height: TSizes.defaultSpace /2),
SizedBox(
width: double.infinity,
child: ElevatedButton (onPressed: () => Get.to(() => const AddNewAddressScreen()), 
child: const Text('Add new address')
),
),
],
), 
)
);
}


}
