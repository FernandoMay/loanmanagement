import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:loan_management/domain/entities/loan.dart';
import 'package:loan_management/domain/usecases/get_loans.dart';
import 'package:loan_management/domain/usecases/update_loan_status.dart';
import 'package:loan_management/presentation/bloc/loan_bloc.dart';

@GenerateNiceMocks([
  MockSpec<GetLoans>(),
  MockSpec<UpdateLoanStatus>(),
])
import 'loan_bloc_test.mocks.dart';

void main() {
  late LoanBloc bloc;
  late MockGetLoans mockGetLoans;
  late MockUpdateLoanStatus mockUpdateLoanStatus;

  setUp(() {
    mockGetLoans = MockGetLoans();
    mockUpdateLoanStatus = MockUpdateLoanStatus();
    bloc = LoanBloc(
      getLoans: mockGetLoans,
      updateLoanStatus: mockUpdateLoanStatus,
    );
  });

  tearDown(() {
    bloc.close();
  });

  final testLoans = [
    Loan(
      id: '1',
      type: 'Personal',
      amount: 1000,
      weeklyAmount: 100,
      paymentDate: DateTime.now(),
    ),
  ];

  blocTest<LoanBloc, LoanState>(
    'emits [LoanLoading, LoanLoaded] when LoadLoans is added',
    build: () {
      when(mockGetLoans.execute())
          .thenAnswer((_) async => testLoans);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadLoans()),
    expect: () => [
      LoanLoading(),
      LoanLoaded(testLoans),
    ],
  );

  blocTest<LoanBloc, LoanState>(
    'emits [LoanLoading, LoanLoaded] when UpdateLoanStatus is added',
    build: () {
      when(mockUpdateLoanStatus.execute('1', true))
          .thenAnswer((_) async {});
      when(mockGetLoans.execute())
          .thenAnswer((_) async => testLoans);
      return bloc;
    },
    act: (bloc) => bloc.add(UpdateLoanStatusEvent('1', true)),
    expect: () => [
      LoanLoading(),
      LoanLoaded(testLoans),
    ],
  );
}