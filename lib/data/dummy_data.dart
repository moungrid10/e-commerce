import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:e_commerce/routes/routes.dart';


class DummyData{
  // static final List<BannerModel> banners = [
   // BannerModel(imageUrl: imageUrl, targetScreen: targetScreen, active: active)
  //]
static final List<BannerModel> banners = [
  BannerModel(imageUrl: 'https://mapmodnews.com/wp-content/uploads/2021/11/6e8bae1b4eed830cc755df65ac75312ce81e4554-e1637905616462.jpeg', targetScreen: TRoutes.store, active: true),
  BannerModel(imageUrl: 'https://www.candrmagazine.com/wp-content/uploads/2022/06/tools.png', targetScreen: TRoutes.store, active: true),
  BannerModel(imageUrl: 'https://storage.pixteller.com/designs/designs-images/2020-12-21/05/sport-shoes-sale-banner-1-5fe0c471dbecb.png', targetScreen: TRoutes.store, active: true),

]
;
static final List<CategoryModel> categories = [
  CategoryModel(id: '1', name: 'Sport', image: 'assets/images/categories/balls-sports.png', isFeatured: true),
  CategoryModel(id: '2', name: 'Sport T-Shirts', image: 'assets/images/categories/balls-sports.png', isFeatured: true, parentId: '1'),
  CategoryModel(id: '3', name: 'Sport Shoes', image: 'assets/images/categories/balls-sports.png', isFeatured: true, parentId: '1'),



  CategoryModel(id: '4', name: 'Decoration', image: 'assets/images/categories/living-room.png', isFeatured: true),
  CategoryModel(id: '5', name: 'Living room', image: 'assets/images/categories/living-room.png', isFeatured: true, parentId: '4'),
  CategoryModel(id: '6', name: 'kitchen', image: 'assets/images/categories/living-room.png', isFeatured: true,parentId: '4'),
  
  CategoryModel(id: '7', name: 'Camping', image: 'assets/images/categories/tent.png', isFeatured: true),
  CategoryModel(id: '8', name: 'Camping materials', image: 'assets/images/categories/tent.png', isFeatured: true, parentId: '7'),

    CategoryModel(id: '9', name: 'Electronics', image: 'assets/images/categories/device.png', isFeatured: true),
  CategoryModel(id: '11', name: 'Personal computers', image: 'assets/images/categories/device.png', isFeatured: true, parentId: '9'),
    CategoryModel(id: '12', name: 'Televisions', image: 'assets/images/categories/device.png', isFeatured: true, parentId: '9'),
      CategoryModel(id: '13', name: 'Phones', image: 'assets/images/categories/device.png', isFeatured: true, parentId: '9'),

    CategoryModel(id: '14', name: 'Tools', image: 'assets/images/categories/settings (2).png', isFeatured: true),
  CategoryModel(id: '15', name: 'Building Tools', image: 'assets/images/categories/settings (2).png', isFeatured: true, parentId: '14'),
  CategoryModel(id: '16', name: 'All Tools', image: 'assets/images/categories/settings (2).png', isFeatured: true, parentId: '14'),

    CategoryModel(id: '17', name: 'Animals', image: 'assets/images/categories/pawprint.png', isFeatured: true),
  CategoryModel(id: '18', name: 'Cats', image: 'assets/images/categories/pawprint.png', isFeatured: true, parentId: '17'),
  CategoryModel(id: '19', name: 'Dogs', image: 'assets/images/categories/pawprint.png', isFeatured: true, parentId: '17'),

];
static final List<ProductModel> products = [ 
ProductModel(
id: '004',
title: 'Nike Air Max SC',
stock: 15,
price: 135,
isFeatured: true,
thumbnail: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b00277c3-a26b-4d49-bb4d-96745e07f4ee/WMNS+NIKE+AIR+MAX+SC.png",
description: 'With its easy going lines, heritage track look and of course, visible Air cushioning, the Nike Air Max SC is the perfect finish to any outfit. The rich mixture of materials adds depth while making it a durable and lightweight shoe for everyday wear.',
brand: BrandModel(id: '1', image: "assets/images/store/nike.png", name: 'Nike', productCount: 265, isFeatured: true), images: ["https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b00277c3-a26b-4d49-bb4d-96745e07f4ee/WMNS+NIKE+AIR+MAX+SC.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0c542190-ba8d-4a32-8bed-b12284e3d589/WMNS+NIKE+AIR+MAX+SC.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4e233a79-1a6d-40af-a0d3-2f5ad99ba71e/W+NIKE+AIR+MAX+SC.png", ], salePrice: 30,
sku: 'ABR4568', 
categoryId: '1',
productAttributes: [

ProductAttributeModel (name: 'Color', values: ['Black', 'Blue', 'Red']), 
ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 40', 'EU 50']),
],
productVariations: [
ProductVariationModel(
id: '1',
stock: 34,
price: 134,
salePrice: 122.6,
image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0c542190-ba8d-4a32-8bed-b12284e3d589/WMNS+NIKE+AIR+MAX+SC.png",
description: 'With its easy going lines, heritage track look and of course, visible Air cushioning, the Nike Air Max SC is the perfect finish to any outfit. The rich mixture of materials adds depth while making it a durable and lightweight shoe for everyday wear.' ,

attributeValues: {'Color': 'Black', 'Size': 'EU 30'}),  
ProductVariationModel(
id: '2',
stock: 15,
price: 132,
image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b00277c3-a26b-4d49-bb4d-96745e07f4ee/WMNS+NIKE+AIR+MAX+SC.png",
attributeValues: {'Color': 'Yellow', 'Size': 'EU 40'},
), // Product VariationModel
ProductVariationModel(
id: '3', stock: 0,
price: 234,
image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4e233a79-1a6d-40af-a0d3-2f5ad99ba71e/W+NIKE+AIR+MAX+SC.png",
attributeValues: {'Color': 'Red', 'Size': 'EU 50'},
), // Product VariationModel

],
productType: 'ProductType.variable',
),




ProductModel(
id: '005',
title: 'Nike Air DT Max 96',
stock: 88,
price: 120,
isFeatured: true,
thumbnail: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/294e0074-5759-4203-823e-f7a9fe9ea19b/AIR+DT+MAX+%2796.png",
description: 'First released in 1996, the Air DT Max is back again. Featuring the adjustable strap and responsive cushioning of the original shoe, this version ups the style factor with a repeating "AIR" graphic. ',
brand: BrandModel(id: '3', image: "assets/images/store/nike.png", name: 'Nike', productCount: 100, isFeatured: true), images: ["https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/294e0074-5759-4203-823e-f7a9fe9ea19b/AIR+DT+MAX+%2796.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/56326f22-0e0a-4ad8-8154-904b3fd870f0/AIR+DT+MAX+%2796.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e646456c-eb82-47da-950b-39c40c422000/AIR+DT+MAX+%2796.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ba894c54-122c-430e-9837-292389451924/AIR+DT+MAX+%2796.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/54e65797-38a0-4b31-b4cc-70d02cc9ed5b/AIR+DT+MAX+%2796.png" ], salePrice: 40,
sku: 'ABR4568', categoryId: '1',
productAttributes: [

ProductAttributeModel (name: 'Color', values: ['Black',]), 
ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 50']),
],
productVariations: [
ProductVariationModel(
id: '1',
stock: 34,
price: 134,
salePrice: 122.6,
image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/294e0074-5759-4203-823e-f7a9fe9ea19b/AIR+DT+MAX+%2796.png",
description: 'First released in 1996, the Air DT Max is back again. Featuring the adjustable strap and responsive cushioning of the original shoe, this version ups the style factor with a repeating "AIR" graphic.' ,

attributeValues: {'Color': 'Black', 'Size': 'EU 40'}),  

],
productType: 'ProductType.single',
),
ProductModel(
id: '006',
title: 'Giannis Immortality 4',
stock: 88,
price: 120,
isFeatured: true,
thumbnail: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3854c363-408c-406f-9a16-02b012c7083a/GIANNIS+IMMORTALITY+4.png",
description: 'The Giannis Immortality 4 is for the multifaceted player. The sleek, supportive heel shape combines with an upgraded traction pattern from the previous iteration to help keep you making all those game-changing plays.',
brand: BrandModel(id: '3', image: "assets/images/store/nike.png", name: 'Nike', productCount: 100, isFeatured: true), images: ["https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3854c363-408c-406f-9a16-02b012c7083a/GIANNIS+IMMORTALITY+4.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2fd0111f-f46f-4c64-a99a-e67a79198660/GIANNIS+IMMORTALITY+4.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6e2214a3-4bfc-41c2-9dd1-ee7a3d0891f2/GIANNIS+IMMORTALITY+4.png","https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ae32c531-715e-4b92-9d4d-6a3d7f3681e4/GIANNIS+IMMORTALITY+4.png",], salePrice: 107,
sku: 'ABR4568', categoryId: '1',
productAttributes: [

ProductAttributeModel (name: 'Color', values: ['Pink',]), 
ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 40']),
],
productVariations: [
ProductVariationModel(
id: '1',
stock: 34,
price: 134,
salePrice: 122.6,
image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3854c363-408c-406f-9a16-02b012c7083a/GIANNIS+IMMORTALITY+4.png",
description: 'The Giannis Immortality 4 is for the multifaceted player. The sleek, supportive heel shape combines with an upgraded traction pattern from the previous iteration to help keep you making all those game-changing plays.' ,

attributeValues: {'Color': 'Pink', 'Size': 'EU 40'}),  

],
productType: 'ProductType.single',
),
];

}



