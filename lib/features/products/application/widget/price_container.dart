import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/num_extensions.dart';

class PriceChip extends StatelessWidget {
  final double price;

  const PriceChip({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color discountColor = theme.colorScheme.secondaryContainer;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      decoration: ShapeDecoration(
        color: discountColor,
        shape: const StadiumBorder(),
      ),
      child: Text(
        '\$ ${price.thousandSeparator(decimalPad: 2)}',
        style: TextStyle(
          color: theme.colorScheme.onSecondaryContainer,
          fontSize: 16.0,
          letterSpacing: 0.15,
          fontWeight: FontWeight.normal,
        ),
        maxLines: 1,
      ),
    );
  }
}
