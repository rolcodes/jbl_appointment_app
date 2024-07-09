import 'package:equatable/equatable.dart';

class ProductItem extends Equatable {
  final int id;
  final int productId;
  final String name;
  final String category;
  final String description;
  final int price;

  const ProductItem({
    required this.id,
    required this.category,
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        productId,
        name,
        category,
        description,
        price,
      ];

  static List<ProductItem> productItems = [
    const ProductItem(
      id: 1,
      productId: 1,
      name: 'JBL Signature White Drip',
      category: 'Gluta Drip',
      description: 'Luxe liquid sunshine for a radiant glow.',
      price: 2799,
    ),
    const ProductItem(
      id: 2,
      productId: 1,
      name: 'Cinderella Drip',
      category: 'Gluta Drip',
      description: 'Transform your skin overnight, enchanting beauty.',
      price: 1899,
    ),
    const ProductItem(
      id: 3,
      productId: 1,
      name: 'Sexy White Drip',
      category: 'Gluta Drip',
      description: 'Diamond-bright skin, effortlessly chic.',
      price: 1299,
    ),
    const ProductItem(
      id: 4,
      productId: 1,
      name: 'Melasma Drip',
      category: 'Gluta Drip',
      description: 'Fade sun spots & reveal even-toned skin.',
      price: 1199,
    ),
    const ProductItem(
      id: 5,
      productId: 1,
      name: 'Perfect White Skin Push',
      category: 'Gluta Push',
      description: 'Indulge in a refreshing facial, reviving your skin.',
      price: 399,
    ),
    const ProductItem(
      id: 6,
      productId: 1,
      name: 'Cleaning Push',
      category: 'Gluta Push',
      description: 'Boost & energize with a vitamin infusion.',
      price: 499,
    ),
    const ProductItem(
      id: 7,
      productId: 1,
      name: 'Celebrity Pinkish Push',
      category: 'Gluta Push',
      description: 'Get red-carpet ready with a rosy radiance.',
      price: 599,
    ),


    const ProductItem(
      id: 2,
      productId: 2,
      name: 'Melasma Drip',
      category: 'Eye Service',
      description: 'I love JAF Digital Markekting & IT Services',
      price: 1189,
    ),
    const ProductItem(
      id: 3,
      productId: 3,
      name: 'JBL Signature White Drip',
      category: 'Waxing Service',
      description: 'I love JAF Digital Markekting & IT Services',
      price: 1499,
    ),

  ];
}
