import '../repositories/loan_repository.dart';

class UpdateLoanStatus {
  final LoanRepository repository;

  UpdateLoanStatus(this.repository);

  Future<void> execute(String loanId, bool isPaid) async {
    await repository.updateLoanStatus(loanId, isPaid);
  }
}