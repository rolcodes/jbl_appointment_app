import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../services/shared_pref.dart';
import '../../../utils/constants/colors.dart';

class AdminProfileTile extends StatefulWidget {
  const AdminProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<AdminProfileTile> createState() => _AdminProfileTileState();
}

class _AdminProfileTileState extends State<AdminProfileTile> {
  String? name, email, image;

  /// Get name, email, image from local storage
  getDataFromSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
    image = await SharedPreferenceHelper().getUserImage();
    setState(() {});
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image!)),
      title: Text(
        name!,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        email!,
        style:
        Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: widget.onPressed,
          icon: const Icon(
            Iconsax.user_edit4,
            color: TColors.white,
          )),
    );
  }
}
