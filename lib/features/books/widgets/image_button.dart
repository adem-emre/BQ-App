import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_assets.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        width: context.setScaledWidth(0.36),
        height: context.setScaledHeight(0.3),
        child: Icon(
          Icons.add_photo_alternate_outlined,
          size: context.setScaledWidth(0.10),
          color: Colors.white,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
            border: Border.all(color: Colors.black, width: 1),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppAssets.defaultCoverImg,
                ))),
      ),
    );
  }
}
