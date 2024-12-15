import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/loan.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;
  final Function(bool) onStatusChanged;

  const LoanCard({
    Key? key,
    required this.loan,
    required this.onStatusChanged,
  }) : super(key: key);

  String _formatPaymentDate() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    if (loan.paymentDate.year == now.year &&
        loan.paymentDate.month == now.month &&
        loan.paymentDate.day == now.day) {
      return 'Hoy';
    } else if (loan.paymentDate.year == tomorrow.year &&
        loan.paymentDate.month == tomorrow.month &&
        loan.paymentDate.day == tomorrow.day) {
      return 'Mañana';
    } else {
      return DateFormat('dd/MM/yyyy').format(loan.paymentDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loan.type,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Checkbox(
                  value: loan.isPaid,
                  onChanged: (value) => onStatusChanged(value ?? false),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Monto total: \$${loan.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Pago semanal: \$${loan.weeklyAmount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Fecha de pago: ${_formatPaymentDate()}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}