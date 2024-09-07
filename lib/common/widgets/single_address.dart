
import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/features/shop/models/address_model.dart';
import 'package:e_commerce/features/shop/screens/address/address_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key, required this.address, required this.onTap,
 
  });

  final AddressModel address;
  final VoidCallback onTap;

 

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
        final dark = THelperFunctions.isDarkMode(context);

    return Obx(()
      { 
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
        onTap: onTap,
        child: TRroundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress ? Colors.transparent : dark ? TColors.darkerGrey : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBetweenItems),
          child: Stack(children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? TColors.light : TColors.black.withOpacity(0.6) : null,)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(address.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: TSizes.sm /2,),
                  Text(address.formattedPhoneNo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                //style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm /2,),
        
                 Text(address.toString(),
                softWrap: true,
                ),
              ],)
        
          ],),
        ),
      );
      }
    );
  }
}