import 'package:flutter/material.dart';

class ThingSpecificationItem extends StatelessWidget {
  const ThingSpecificationItem({
    Key? key,
    required this.heading,
    required this.detail,
  }) : super(key: key);

  final String heading;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(heading),
          const Spacer(),
          Text(detail, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
