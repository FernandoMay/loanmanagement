import 'package:get_it/get_it.dart';
import '../../data/datasources/loan_local_data_source.dart';
import '../../data/repositories/loan_repository_impl.dart';
import '../../domain/repositories/loan_repository.dart';
import '../../domain/usecases/get_loans.dart';
import '../../domain/usecases/update_loan_status.dart';
import '../../presentation/bloc/loan_bloc.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  // Data sources
  getIt.registerLazySingleton<LoanLocalDataSource>(
    () => LoanLocalDataSourceImpl(),
  );

  // Repositories
  getIt.registerLazySingleton<LoanRepository>(
    () => LoanRepositoryImpl(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetLoans(getIt()));
  getIt.registerLazySingleton(() => UpdateLoanStatus(getIt()));

  // Bloc
  getIt.registerFactory(
    () => LoanBloc(
      getLoans: getIt(),
      updateLoanStatus: getIt(),
    ),
  );
}