import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constraints.dart';

class NoImapePreviewProduct extends StatelessWidget {
  const NoImapePreviewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.image_not_supported),
        gap8,
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'No preview available',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(fontSize: 10.0),
          ),
        ),
      ],
    );
  }
}