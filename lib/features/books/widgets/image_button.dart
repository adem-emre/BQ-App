import 'dart:io';

import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_assets.dart';

class ImageButton extends StatefulWidget {
  final String? imagePath;
  final Future<String?> Function() onTap;
  const ImageButton({
    Key? key,
    required this.onTap,
    this.imagePath,
  }) : super(key: key);

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  String? filePath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        filePath = await widget.onTap();
        setState(() {});
      },
      child: Ink(
        width: context.setScaledWidth(0.36),
        height: context.setScaledHeight(0.3),
        child: (filePath == null && widget.imagePath == null)
            ? Icon(
                Icons.add_photo_alternate_outlined,
                size: context.setScaledWidth(0.10),
                color: Colors.white,
              )
            : null,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          border: Border.all(color: Colors.black, width: 1),
          image: DecorationImage(fit: BoxFit.cover, image: returnImage()),
        ),
      ),
    );
  }

  ImageProvider<Object> returnImage() {
    if (filePath != null) {
      return FileImage(File(filePath!));
    } else if (widget.imagePath != null) {
      return NetworkImage(widget.imagePath!);
    } else {
      return const AssetImage(AppAssets.defaultCoverImg);
    }
  }
}
