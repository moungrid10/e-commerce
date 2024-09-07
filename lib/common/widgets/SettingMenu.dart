import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({super.key, required this.icon, required this.title, required this.subtitle, this.trailing, this.onTap});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;


  


  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(icon,size: 28,color: TColors.primary,),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium,),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}