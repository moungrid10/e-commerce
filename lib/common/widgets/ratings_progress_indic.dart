
import 'package:e_commerce/common/widgets/RatingaprogressIndicator.dart';
import 'package:flutter/material.dart';

class TOverAllproductRatings extends StatelessWidget {
  const TOverAllproductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text("4.8", style: Theme.of(context).textTheme.displayLarge ,)),
    
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRAtingProgressIndicator(text: "5",value: 0.5,),
              TRAtingProgressIndicator(text: "4",value: 0.8,),
              TRAtingProgressIndicator(text: "3",value: 0.2,),
              TRAtingProgressIndicator(text: "2",value: 0.1,),
              TRAtingProgressIndicator(text: "1",value: 0.05,),
    
            ],
          ),
        ),
      ],
    );
  }
}
