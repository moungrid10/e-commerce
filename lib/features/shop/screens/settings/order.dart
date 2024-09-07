import 'package:e_commerce/common/widgets/Order_list_items.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("Order Review",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),

      body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: TOrderListItems(),),

    );
  }
}