import '../models/loan_model.dart';

abstract class LoanLocalDataSource {
  Future<List<LoanModel>> getLoans();
  Future<void> updateLoanStatus(String loanId, bool isPaid);
}

class LoanLocalDataSourceImpl implements LoanLocalDataSource {
  // Simulated local storage
  final List<LoanModel> _loans = [
    LoanModel(
      id: '1',
      type: 'Personal',
      amount: 1000.0,
      weeklyAmount: 100.0,
      paymentDate: DateTime.now(),
      isPaid: false,
    ),
    LoanModel(
      id: '2',
      type: 'Business',
      amount: 5000.0,
      weeklyAmount: 500.0,
      paymentDate: DateTime.now().add(const Duration(days: 1)),
      isPaid: false,
    ),
  ];

  @override
  Future<List<LoanModel>> getLoans() async {
    return _loans;
  }

  @override
  Future<void> updateLoanStatus(String loanId, bool isPaid) async {
    final index = _loans.indexWhere((loan) => loan.id == loanId);
    if (index != -1) {
      _loans[index] = _loans[index].copyWithModel(isPaid: isPaid);
    }
  }
}