import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/features/shop/screens/address/address_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return  Obx(
      ()=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(title: "Shipping Address", buttonTitle: "Change",onPressed: ()=> addressController.selectNewAddressPopup(context),showActionButton: true,),
          SizedBox(height: TSizes.spaceBetweenItems / 1.5,),
      
          addressController.selectedAddress.value.id.isNotEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(addressController.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: TSizes.spaceBetweenItems / 1.9,),
      
          Row(
            children: [
              Icon(Icons.phone, color: Colors.grey, size: 16,),
              SizedBox(width: TSizes.spaceBetweenItems,),
              Text(addressController.selectedAddress.value.phoneNumber, style: Theme.of(context).textTheme.bodyMedium),
      
            ],
      
        
          ),
          SizedBox(height: TSizes.spaceBetweenItems / 2,),
          Row(
            children: [
              Icon(Icons.location_history, color: Colors.grey, size: 16,),
      
              SizedBox(width: TSizes.spaceBetweenItems,),
      
              Flexible(child: Text(addressController.selectedAddress.value.toString(), style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
      
            ],
      
        
          ),
            ],
          )
                      
          : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium,)  
      
        ],
      ),
    );
    
  }
}