import 'package:tesla_app/config/service_locator.dart';

import 'package:tesla_app/models/product_model.dart';

import '../services/constants/images.dart';
import '../services/constants/strings.dart';


class ProductData {
  static final List<Product> shop = [
    /// #First Product
    Product(
      CustomStrings.tesla,
      CustomStrings.information,
      shoppingDetails.carPrice.toString(),
      CustomImages.teslaModelS,
    ),

    /// #Second Product
    Product(
      CustomStrings.tesla,
      CustomStrings.information,
      shoppingDetails.carPrice.toString(),
      CustomImages.teslaModelS,
    ),

    /// #Third Product
    Product(
      CustomStrings.tesla,
      CustomStrings.information,
      shoppingDetails.carPrice.toString(),
      CustomImages.teslaModelS,
    ),

    /// #Fourth Product
    Product(
      CustomStrings.tesla,
      CustomStrings.information,
      shoppingDetails.carPrice.toString(),
      CustomImages.teslaModelS,
    ),
  ];
}