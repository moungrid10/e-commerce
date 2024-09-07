import 'package:e_commerce/common/widgets/Userreviewcard.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/rating_bar.dart';
import 'package:e_commerce/common/widgets/ratings_progress_indic.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("Reviews & Ratings",style: Theme.of(context).textTheme.headlineSmall),showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text("Ratings and reviews are verified and from real people that use the phone like use it "),


          const SizedBox(height: TSizes.spaceBetweenItems ,),

          const TOverAllproductRatings(),

          const TRatingBarIndicator(rating: 3.5),
          Text("12.865",style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: TSizes.spaceBetweenItems * 1.5 ,),

          const UserReviewCard(),
          const SizedBox(height: TSizes.spaceBetweenSections ,),

          const UserReviewCard(),



          




        ],),),


      ),


    );
  }
}
