 import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/rating_bar.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const CircleAvatar(backgroundImage: AssetImage("assets/images/employe.png"),),
              const SizedBox(width: TSizes.spaceBetweenItems,),
              Text("Peter kan", style: Theme.of(context).textTheme.titleLarge,),
            ],),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBetweenItems,),
        Row(children: [
          const TRatingBarIndicator(rating: 4),
          const SizedBox(width: TSizes.spaceBetweenItems,),
          Text("1 Nov, 2024", style: Theme.of(context).textTheme.bodyMedium,),




        ],),
        const SizedBox(height: TSizes.spaceBetweenItems,),
        const ReadMoreText("i liked the product , it really helpful it makes my day easier , thank u and keep going ",
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: ' Less',
        trimCollapsedText: ' Show more',
        moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: TColors.primary),
        lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBetweenItems,),




        

        TRroundedContainer(backgroundColor: TColors.grey,
          padding: const EdgeInsets.all(TSizes.defaultSpace / 1.5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Grid Store",style: Theme.of(context).textTheme.bodyLarge),
                const Text("09-Jan-2024",),

              
              
              ],),
              const SizedBox(height: TSizes.defaultSpace /2,),
              const ReadMoreText("Thank you for being lind , i hope this product fit you and have a great journey with it, and if u have feedbacks just tell us and thank u ",
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: ' Less',
        trimCollapsedText: ' Show more',
        moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: TColors.primary),
        lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: TColors.primary),
        ),
            ],
          ),
          
          ),
        
        
      ],
    );
  }
}
