import 'package:equatable/equatable.dart';

class Loan extends Equatable {
  final String id;
  final String type;
  final double amount;
  final double weeklyAmount;
  final DateTime paymentDate;
  final bool isPaid;

  const Loan({
    required this.id,
    required this.type,
    required this.amount,
    required this.weeklyAmount,
    required this.paymentDate,
    this.isPaid = false,
  });

  Loan copyWith({
    String? id,
    String? type,
    double? amount,
    double? weeklyAmount,
    DateTime? paymentDate,
    bool? isPaid,
  }) {
    return Loan(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      weeklyAmount: weeklyAmount ?? this.weeklyAmount,
      paymentDate: paymentDate ?? this.paymentDate,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  @override
  List<Object?> get props => [id, type, amount, weeklyAmount, paymentDate, isPaid];
}