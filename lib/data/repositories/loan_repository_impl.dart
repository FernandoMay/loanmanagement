import '../../domain/entities/loan.dart';
import '../../domain/repositories/loan_repository.dart';
import '../datasources/loan_local_data_source.dart';

class LoanRepositoryImpl implements LoanRepository {
  final LoanLocalDataSource localDataSource;

  LoanRepositoryImpl(this.localDataSource);

  @override
  Future<List<Loan>> getLoans() async {
    return await localDataSource.getLoans();
  }

  @override
  Future<void> updateLoanStatus(String loanId, bool isPaid) async {
    await localDataSource.updateLoanStatus(loanId, isPaid);
  }
}