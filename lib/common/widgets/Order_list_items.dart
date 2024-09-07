import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/features/shop/controllers/order_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
     final dark = THelperFunctions.isDarkMode(context);
     final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
         if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return Center(child: Text('Whoops! Orders is empty ..'));
              }
              if(snapshot.hasError){
                return Center(child: Text('Something went wrong'));
            
              }
            
              final orders = snapshot.data!;


        return ListView.separated(
        shrinkWrap: true,
        itemCount: orders.length,
        separatorBuilder: (_, index) => SizedBox(height: TSizes.spaceBetweenItems,),
        itemBuilder: (_, index){
          final order = orders[index];
          return TRroundedContainer(
          
          showBorder: true,
          backgroundColor: dark? TColors.black: TColors.light,
          padding: EdgeInsets.all(TSizes.sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                
                children: [
                  Icon(Iconsax.ship),
                  SizedBox(width: TSizes.spaceBetweenItems / 2,),
        
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.orderStatusText,
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),),
                        Text(order.formattedOrderDate,style: Theme.of(context).textTheme.headlineSmall ),
                    
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,))
                ],
              ),
              SizedBox(height: TSizes.spaceBetweenItems / 2,),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: TSizes.spaceBetweenItems / 2,),
                    
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order",
                              style: Theme.of(context).textTheme.labelMedium),
                              Text(order.id,style: Theme.of(context).textTheme.titleMedium ),
                          
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                                
                                children: [
                    Icon(Iconsax.calendar),
                    SizedBox(width: TSizes.spaceBetweenItems / 2,),
                    
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shipping Date",
                          style: Theme.of(context).textTheme.labelMedium),
                          Text(order.formattedDeliveryDate,style: Theme.of(context).textTheme.titleMedium ),
                      
                        ],
                      ),
                    ),
                    
                                ],
                              ),
                  )
                ],
              )
        
            ],
          ),
        
        
        );}
      );
        
      } 
    );
  }
}