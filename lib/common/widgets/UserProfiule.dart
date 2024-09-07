
import 'package:e_commerce/common/style/user_controller.dart';
import 'package:e_commerce/common/widgets/TCircleImage.dart';
import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx((){
                  final networkImage = controller.user.value.profilePicture;
                  final image = networkImage.isNotEmpty ? networkImage : "assets/images/homme.png";
                  


                  return controller.imageUploading.value
                  ? ShimmerEffect(width: 50, height: 50, radius: 50,)
                  : TCircleImage(
                image: image, width: 50, height: 50,isNetworkImage: networkImage.isNotEmpty,);
                }),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),     
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white,)),
     );
  }
}