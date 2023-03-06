import 'package:flutter/material.dart';

class FashionFilters extends StatelessWidget {
  final String? filterName;
  final Color? borderColor;
  const FashionFilters({
    required this.filterName,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          filterName!,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            color: borderColor,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(
          color: borderColor!,
        ),
      ),
      onSelected: (bool value) {},
    );
  }
}
