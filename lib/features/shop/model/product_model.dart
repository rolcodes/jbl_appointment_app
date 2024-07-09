import 'package:appointment_app/features/shop/model/product_item_model.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final String location;
  final int discount;
  final List<String> tags;
  final List<ProductItem> productItems;

  const Product({
    required this.location,
    required this.discount,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.productItems,
  });

  @override
  List<Object?> get props => [id, imageUrl, name, tags];

  static List<Product> products = [
    Product(
      id: 1,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=hdqsW0SDBScQ7kNvgHxxd11&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfAwn1tPK0QOxfYBAz3fDWu8j27d9AauEWZ_zmdzCifXwQ&oe=6640CC9A',
      discount: 10,
      name: 'Skin Care',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 1)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 1)
          .toList(),
    ),
    Product(
      id: 2,
      imageUrl: 'https://scontent.fmnl4-1.fna.fbcdn.net/v/t39.30808-6/440358179_791559753073872_1915027507325831504_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEJsmw8epYpW3IevQ9bz3Ax6YGdHd2McmvpgZ0d3YxyawbpK6lVE0mCDUTkbciJBRN4LVsO1WJ0Xo8CWOf0AYOR&_nc_ohc=H8sTtGFA16oQ7kNvgFhXNMe&_nc_oc=Adh1GlfbOU9m6CuTPfpsOVxhPsQuAsEz_02l1BL1CureDumUsZpML4VFSHDzrB-Hv-0&_nc_zt=23&_nc_ht=scontent.fmnl4-1.fna&oh=00_AfBn8k4Z3ES8d7uqnd1v7pP2FTWes_E8dTTUHxOaZ4bjWw&oe=6640BF9B',
      discount: 10,
      name: 'Eye Service',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 2)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 2)
          .toList(),
    ),
    Product(
      id: 3,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/440364018_791570776406103_9212665597442629329_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHkQ9WQNBg6vSGwAIAb5RooBpa9mFEKbwQGlr2YUQpvBCuuQY4V2G2GlFO_T1WyhNbKDju6CG9TPXuVwygjgCLN&_nc_ohc=bSEi5yS9ZJAQ7kNvgFuCiuO&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfDqTvNYyQqyLD8114P5Wtt6DXc0KhS6pyHtN_2pPVYYyw&oe=6640C815',
      discount: 10,
      name: 'Massage Service',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 3)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 3)
          .toList(),
    ),
    Product(
      id: 4,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=hdqsW0SDBScQ7kNvgHxxd11&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfAwn1tPK0QOxfYBAz3fDWu8j27d9AauEWZ_zmdzCifXwQ&oe=6640CC9A',
      discount: 10,
      name: 'Waxing Service',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 4)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 4)
          .toList(),
    ),
    Product(
      id: 5,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=hdqsW0SDBScQ7kNvgHxxd11&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfAwn1tPK0QOxfYBAz3fDWu8j27d9AauEWZ_zmdzCifXwQ&oe=6640CC9A',
      discount: 10,
      name: 'Nail Service',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 1)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 5)
          .toList(),
    ),
    Product(
      id: 6,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=hdqsW0SDBScQ7kNvgHxxd11&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfAwn1tPK0QOxfYBAz3fDWu8j27d9AauEWZ_zmdzCifXwQ&oe=6640CC9A',
      discount: 10,
      name: 'Laser Treatment',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 1)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 6)
          .toList(),
    ),
    Product(
      id: 7,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=hdqsW0SDBScQ7kNvgHxxd11&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfAwn1tPK0QOxfYBAz3fDWu8j27d9AauEWZ_zmdzCifXwQ&oe=6640CC9A',
      discount: 10,
      name: 'Mesolipo',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 1)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 7)
          .toList(),
    ),
    Product(
      id: 8,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=hdqsW0SDBScQ7kNvgHxxd11&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfAwn1tPK0QOxfYBAz3fDWu8j27d9AauEWZ_zmdzCifXwQ&oe=6640CC9A',
      discount: 10,
      name: 'Lipolysis',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 1)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 8)
          .toList(),
    ),
    Product(
      id: 9,
      imageUrl: 'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=hdqsW0SDBScQ7kNvgHxxd11&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AfAwn1tPK0QOxfYBAz3fDWu8j27d9AauEWZ_zmdzCifXwQ&oe=6640CC9A',
      discount: 10,
      name: 'Facial Service',
      tags: ProductItem.productItems
          .where((productItem) => productItem.productId == 1)
          .map((productItem) => productItem.category)
          .toSet()
          .toList(),
      location: 'Bucandala IV, Imus City, Cavite',
      productItems: ProductItem.productItems
          .where((productItem) => productItem.productId == 9)
          .toList(),
    ),
  ];
}
