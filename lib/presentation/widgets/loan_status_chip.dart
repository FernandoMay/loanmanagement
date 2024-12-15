import 'package:flutter/material.dart';

class LoanStatusChip extends StatelessWidget {
  final bool isPaid;

  const LoanStatusChip({
    Key? key,
    required this.isPaid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isPaid ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isPaid ? 'PAGADO' : 'PENDIENTE',
        style: TextStyle(
          color: isPaid ? Colors.green.shade700 : Colors.red.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}