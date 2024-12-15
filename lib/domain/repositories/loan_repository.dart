import '../entities/loan.dart';

abstract class LoanRepository {
  Future<List<Loan>> getLoans();
  Future<void> updateLoanStatus(String loanId, bool isPaid);
}