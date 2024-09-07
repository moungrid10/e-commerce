import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/single_address.dart';
import 'package:e_commerce/features/shop/screens/address/NewAddress.dart';
import 'package:e_commerce/features/shop/screens/address/address_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: ()=>Get.to(()=> const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white,),),
        appBar: TAppBar(showBackArrow: true,
        title: Text("Addresses", style: Theme.of(context).textTheme.headlineMedium,)
        ),
        body:  SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            ()=> FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getallUserAddresses(),
              builder: (context, snapshot) {
            
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                  return Center(child: Text('Whoops! Wishlist is empty ..'));
                }
                if(snapshot.hasError){
                  return Center(child: Text('Something went wrong'));
              
                }
                final addresses = snapshot.data!;
            
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) {
                    return SingleAddress(address: addresses[index],onTap: ()=> controller.selectAddress(addresses[index]),);
                  },
                  );
              }, 
            ),
          ),
        ),
        )
        
        
    );
  }
}
