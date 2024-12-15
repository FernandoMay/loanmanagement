import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/loan.dart';
import 'loan_status_chip.dart';
import 'payment_date_chip.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;
  final Function(bool) onStatusChanged;

  const LoanCard({
    Key? key,
    required this.loan,
    required this.onStatusChanged,
  }) : super(key: key);

  String _formatPaymentDate() {
    return DateFormat('dd/MM/yyyy').format(loan.paymentDate);
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            loan.type.toLowerCase() == 'personal' 
                                ? Icons.person
                                : Icons.business,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            loan.type,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          LoanStatusChip(isPaid: loan.isPaid),
                          const SizedBox(width: 8),
                          PaymentDateChip(paymentDate: loan.paymentDate),
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: loan.isPaid,
                    activeColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onChanged: (bool? value) {
                      if (value != null) {
                        onStatusChanged(value);
                      }
                    },
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            _InfoRow(
              icon: Icons.attach_money,
              label: 'Monto total:',
              value: currencyFormat.format(loan.amount),
            ),
            const SizedBox(height: 8),
            _InfoRow(
              icon: Icons.calendar_today,
              label: 'Pago semanal:',
              value: currencyFormat.format(loan.weeklyAmount),
            ),
            const SizedBox(height: 8),
            _InfoRow(
              icon: Icons.event,
              label: 'Fecha de pago:',
              value: _formatPaymentDate(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        const Spacer(),
        // const SizedBox(width: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}