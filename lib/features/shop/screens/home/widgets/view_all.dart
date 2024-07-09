import 'package:appointment_app/common/widgets/products/product_cards/horizontal_product_card.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:iconsax/iconsax.dart';

import '../../notifications/notifications.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: TColors.primary,
          ),
        ),
        centerTitle: true,
        title: Text('Best Deals',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.primary, fontSizeDelta:8)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -12),
              showBadge: true,
              ignorePointer: false,
              onTap: () => Get.to(() => const NotificationScreen()),
              badgeContent: Text(
                '3',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(color: TColors.white),
              ),
              badgeAnimation: const badges.BadgeAnimation.scale(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              badgeStyle: const badges.BadgeStyle(badgeColor: TColors.primary),
              child: const Icon(
                Iconsax.notification,
                size: 24,
                color: TColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                shadowColor: TColors.primary,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/content/best_deal.png'),
                ),
              ),
              const SizedBox(height: 30),

              /// Products
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Face-Treatment-Jevelme-Beauty-Lounge.webp',
                title: 'RF Face',
                subtitle: "Sculpt and tighten for youthful radiance.",
                price: '₱349',
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Perming-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Eyelash Perming',
                subtitle: 'Transform with our mesmerizing eyelash perming.',
                price: '₱399',
                alignment: Alignment(0, -0.8),
              ),
              const SizedBox(height: 20),
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dimond-Peel-with-whitening-services-Jevelme-Beauty-Lounge.webp',
                title: 'Diamond Peel w/ Whitening Facial',
                subtitle:
                    'Exfoliate and brighten with a diamond peel and whitening treatment.',
                price: '₱799',
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Services-Jevelme-Beauty-Lounge.webp',
                title: 'Acne Facial w/ Led Light',
                price: '₱599',
                alignment: Alignment.center,
                subtitle:
                    'Brighten your complexion with a cleansing and whitening facial.',
              ),
              const SizedBox(height: 20),
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Perfect-Skin-Jevelme-Beauty-Lounge.webp',
                title: 'Perfect White Skin Push',
                subtitle: 'Illuminate with our whitening infusion therapy.',
                price: '₱499',
                alignment: Alignment(0, 0.5),
              ),
              const SizedBox(height: 20),
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Center-Services-Jevelme-Beauty-Lounge.webp',
                title: 'European Facial (w/ RF)',
                price: '₱899',
                alignment: Alignment.center,
                subtitle:
                    'Brighten your complexion with a cleansing and whitening facial.',
              ),
              const SizedBox(height: 20),
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Head-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Head Massage',
                price: '₱149',
                alignment: Alignment.center,
                subtitle: 'Soothe headaches and improve scalp circulation.',
              ),
              const SizedBox(height: 20),
              const HorizontalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facila-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Dermaplaning Facial',
                price: '₱799',
                alignment: Alignment.center,
                subtitle:
                    'Smooth, refine skin texture with gentle dermaplaning facial treatments.',
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
