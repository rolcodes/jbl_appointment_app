import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../services/shared_pref.dart';
import '../../../utils/constants/colors.dart';

class TUserProfileTile extends StatefulWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<TUserProfileTile> createState() => _TUserProfileTileState();
}

class _TUserProfileTileState extends State<TUserProfileTile> {
  String? name, email, image, number, id;

  /// Get name, email, number & image from local storage
  getDataFromSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();
    id = await SharedPreferenceHelper().getUserID();
    email = await SharedPreferenceHelper().getUserEmail();
    number = await SharedPreferenceHelper().getUserNumber();
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
      leading: CircleAvatar(radius: 30,
        backgroundImage: AssetImage(image!),
      ),
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
