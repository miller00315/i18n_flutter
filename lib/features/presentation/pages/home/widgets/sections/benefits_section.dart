import 'package:flutter/material.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({Key? key}) : super(key: key);

  Widget benefitItem(String title, String subtitle) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: 45,
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                subtitle,
              ),
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runSpacing: 16, // Between lines
        spacing: 8,
        children: [
          benefitItem('+45000', 'Didática garantida'),
          benefitItem('+45000', 'Didática garantida'),
          benefitItem('+45000', 'Didática garantida'),
        ],
      ),
    );
  }
}
