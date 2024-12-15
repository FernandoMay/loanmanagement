import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:loan_management/domain/entities/loan.dart';
import 'package:loan_management/domain/repositories/loan_repository.dart';
import 'package:loan_management/domain/usecases/get_loans.dart';

@GenerateNiceMocks([MockSpec<LoanRepository>()])
import 'get_loans_test.mocks.dart';

void main() {
  late GetLoans usecase;
  late MockLoanRepository mockLoanRepository;

  setUp(() {
    mockLoanRepository = MockLoanRepository();
    usecase = GetLoans(mockLoanRepository);
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

  test('should get loans from repository', () async {
    // arrange
    when(mockLoanRepository.getLoans())
        .thenAnswer((_) async => testLoans);

    // act
    final result = await usecase.execute();

    // assert
    expect(result, testLoans);
    verify(mockLoanRepository.getLoans());
    verifyNoMoreInteractions(mockLoanRepository);
  });
}