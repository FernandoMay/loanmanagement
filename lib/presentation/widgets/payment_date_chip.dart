import 'package:flutter/material.dart';

class PaymentDateChip extends StatelessWidget {
  final DateTime paymentDate;

  const PaymentDateChip({
    Key? key,
    required this.paymentDate,
  }) : super(key: key);

  (Color, Color) _getColors() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    
    if (paymentDate.year == now.year &&
        paymentDate.month == now.month &&
        paymentDate.day == now.day) {
      return (Colors.orange.shade100, Colors.orange.shade800); // Hoy
    } else if (paymentDate.year == tomorrow.year &&
        paymentDate.month == tomorrow.month &&
        paymentDate.day == tomorrow.day) {
      return (Colors.amber.shade100, Colors.amber.shade600); // Mañana
    } else {
      return (Colors.blue.shade100, Colors.blue.shade600); // Otro día
    }
  }

  String _getDateText() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    if (paymentDate.year == now.year &&
        paymentDate.month == now.month &&
        paymentDate.day == now.day) {
      return 'HOY';
    } else if (paymentDate.year == tomorrow.year &&
        paymentDate.month == tomorrow.month &&
        paymentDate.day == tomorrow.day) {
      return 'MAÑANA';
    } else {
      return 'PRÓXIMO';
    }
  }

  @override
  Widget build(BuildContext context) {
    final (backgroundColor, textColor) = _getColors();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _getDateText(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}