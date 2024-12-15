import '../entities/loan.dart';
import '../repositories/loan_repository.dart';

class GetLoans {
  final LoanRepository repository;

  GetLoans(this.repository);

  Future<List<Loan>> execute() async {
    return await repository.getLoans();
  }
}