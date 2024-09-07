import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/shop/screens/address/address_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return  Scaffold
    (
appBar: const TAppBar(title: Text("Add new Address"),showBackArrow: true,),
 body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                validator: (value) => TValidator.validateEmptyText('Name', value!),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: TSizes.spaceBetweeninputField),
              TextFormField(
                controller: controller.phoneNumber,
                validator: TValidator.validatePhoneNumber,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: TSizes.spaceBetweeninputField),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.street,
                      validator: (value) => TValidator.validateEmptyText('Street', value!),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: 'Street Address',
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBetweenItems),
                  Expanded(
                    child: TextFormField(
                      controller: controller.postalCode,
                validator: (value) => TValidator.validateEmptyText('PostalCode', value!),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: 'Postal Code',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBetweeninputField),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.city,
                validator: (value) => TValidator.validateEmptyText('City', value!),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: 'City',
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBetweeninputField),
                  Expanded(
                    child: TextFormField(
                      controller: controller.state,
                validator: (value) => TValidator.validateEmptyText('State', value!),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: 'State',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBetweeninputField),
              TextFormField(
                controller: controller.country,
                validator: (value) => TValidator.validateEmptyText('Country', value!),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: 'Country',
                ),
              ),
              const SizedBox(height: TSizes.defaultSpace),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.addNewAddressea(),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}