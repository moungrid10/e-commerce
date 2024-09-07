import 'package:e_commerce/features/authentification/screens/Forget%20_Password/forget_password.dart';
import 'package:e_commerce/features/authentification/screens/Login/login.dart';
import 'package:e_commerce/features/authentification/screens/Onboarding/onboarding.dart';
import 'package:e_commerce/features/authentification/screens/Signup/email_verify.dart';
import 'package:e_commerce/features/authentification/screens/Signup/signup.dart';
import 'package:e_commerce/features/shop/screens/address/adrress.dart';
import 'package:e_commerce/features/shop/screens/cart/cartScreen..dart';
import 'package:e_commerce/features/shop/screens/cart/checkout_screen.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/product_detaills/product_reviews.dart';
import 'package:e_commerce/features/shop/screens/profile/profile.dart';
import 'package:e_commerce/features/shop/screens/settings/order.dart';
import 'package:e_commerce/features/shop/screens/settings/settings.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const Store()),
    GetPage(name: TRoutes.favourites, page: () => const Wishlist()),
    GetPage(name: TRoutes.settings, page: () => const Settings()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const Forget_Passwrod()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingClass()),
    // Add more GetPage entries as needed
  ];
}
