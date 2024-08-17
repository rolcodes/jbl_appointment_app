import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';


class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.text,
    required this.color,
    this.imageIcon,
    this.onPressed,
    required this.width,
    required this.height,
    this.style,
  });

  final String text;
  final List<Color> color;
  final String? imageIcon;
  final void Function()? onPressed;
  final double width;
  final double height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onPressed,
        splashColor: TColors.primary,
        borderRadius: BorderRadius.circular(6),
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: color),
              borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: imageIcon == null && style == null
                ? Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.white),
                  )
                : imageIcon == null && style != null
                    ? Text(
                        text,
                        style: style,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            imageIcon!,
                            fit: BoxFit.contain,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            text,
                            style: style,
                          )
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
