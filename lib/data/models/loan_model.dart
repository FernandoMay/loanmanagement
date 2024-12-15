import '../../domain/entities/loan.dart';

class LoanModel extends Loan {
  const LoanModel({
    required String id,
    required String type,
    required double amount,
    required double weeklyAmount,
    required DateTime paymentDate,
    bool isPaid = false,
  }) : super(
          id: id,
          type: type,
          amount: amount,
          weeklyAmount: weeklyAmount,
          paymentDate: paymentDate,
          isPaid: isPaid,
        );

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
      id: json['id'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      weeklyAmount: json['weeklyAmount'].toDouble(),
      paymentDate: DateTime.parse(json['paymentDate']),
      isPaid: json['isPaid'] ?? false,
    );
  }

  factory LoanModel.fromLoan(Loan loan) {
    return LoanModel(
      id: loan.id,
      type: loan.type,
      amount: loan.amount,
      weeklyAmount: loan.weeklyAmount,
      paymentDate: loan.paymentDate,
      isPaid: loan.isPaid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'amount': amount,
      'weeklyAmount': weeklyAmount,
      'paymentDate': paymentDate.toIso8601String(),
      'isPaid': isPaid,
    };
  }

  LoanModel copyWithModel({
    String? id,
    String? type,
    double? amount,
    double? weeklyAmount,
    DateTime? paymentDate,
    bool? isPaid,
  }) {
    return LoanModel(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      weeklyAmount: weeklyAmount ?? this.weeklyAmount,
      paymentDate: paymentDate ?? this.paymentDate,
      isPaid: isPaid ?? this.isPaid,
    );
  }
}